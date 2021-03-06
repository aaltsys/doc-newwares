.. _bill-recur-calc:

#############################
Calculating Recurring Charges
#############################

Recurring is calculated across a date interval or period. The balances of 
active lots are determined for the start of the period, and the transaction 
activity completed within the period is then accumulated to determine an ending 
balance. 

Recurring is audited by comparing the ending balance of a lot in one period to
the starting balance in the succeeding period, and comparing the total of lot 
transactions in a period with the difference between starting and ending 
balances.

Recurring Calculation
=============================

While recurring selects multiple accounts to process in a batch, each account 
is calculated and reported separately. This allows accounts with outstanding 
issues to be skipped, while completing billing for other accounts. 

To calculate recurring, first unverified transactions for the account with 
**Posted** dates before and including the account's recurring calendar **Next** 
date are selected. If any transactions are found the account is skipped; the 
recurring calendar for the account is not updated. 

.. Sidebar:: Recurring Configuration Sources

   +----------------------------------------------------+
   || :menuselection:`Setup --> Accounts`               |
   +----------------------------------------------------+
   | **Account** identifier of the account              |
   +-------------------+--------------------------------+
   || **Recur** code   || anniversary                   |
   ||                  || starting balances             |
   ||                  || ending balances               |
   || **Receive** code || full month                    |
   ||                  || half month                    |
   ||                  || prorated                      |
   +-------------------+--------------------------------+
   | **Freedays** days before receiving is charged      |
   +-------------------+--------------------------------+
   || :menuselection:`Setup --> Calendars`              |
   +-------------------+--------------------------------+
   || Identified by:   || **Group** = **Account**       |
   ||                  || **Code** = **1S**             |
   +-------------------+--------------------------------+
   || **Last + 1** begins calculation interval          |
   || **Next** ends calculation interval                |
   +----------------------------------------------------+
   || :menuselection:`Setup --> Products`               |
   +----------------------------------------------------+
   || identified by:                                    |
   || **Account**, **Product**, and **Variety**         |
   +----------------------------------------------------+
   || **Group** rates for receiving and recurring       |
   +-------------------+--------------------------------+
   || **UOM** codes for|| *Units*                       |
   ||                  || *Packages*                    |
   ||                  || *Inners*                      |
   ||                  || *Weight*                      |
   ||                  || *DIM*                         |
   +-------------------+--------------------------------+
   || :menuselection:`Entry --> Transactions`           |
   +----------------------------------------------------+
   || **Posted** DateTime of inventory change           |
   || **Entered** DateTime transaction is verified      |
   +----------------------------------------------------+
   || :menuselection:`Inventory --> Lots`               |
   +----------------------------------------------------+
   || Identified by:                                    |
   || **Account**, **Product**, **Variety**,            |
   || **Control**, and **Posted**                       |
   +----------------------------------------------------+
   | **Received = Posted + Freedays**                   |
   +----------------------------------------------------+
   || :menuselection:`Billing --> Rates`                |
   +-------------------+--------------------------------+
   || Identified by:   || **Group**                     |
   ||                  || **Code = 1S** (recurring) or  |
   ||                  || **Code = 1R** (receiving)     |
   +-------------------+--------------------------------+
   || **Per** code     || **U** *(Unit)*                |
   ||                  || **P** *(Package)*             |
   ||                  || **I** *(Inner)*               |
   ||                  || **W** *(Net Weight)*          |
   ||                  || **G** *(Gross Weight)*        |
   ||                  || **V** *(Volume* or *DIM)*     |
   +-------------------+--------------------------------+

For accounts which pass the preceding test, active inventory lot records, lots 
which are not **Archived**, are selected for the account by **Product**, 
**Variety**, lot **Control** number, and **Posted** date. An accumulator 
array is initialized to keep inventory balance information by **Product** and 
**Variety**.

For each lot, anniversary **Starting** and **Ending** dates are determined. [1]_

#. If the account has free days [2]_, and if the **Received** date (meaning the 
   Posted date + Free days) is within the recurring interval, then the 
   **Starting** anniversary date is set to the **Received** date, and a 
   receiving calculation flag is raised.
#. If the account uses anniversary recurring: (1) if the receiving flag is 
   raised then the **Ending** date is left blank, or (2) if the lot anniversary 
   falls within the recurring interval then the **Ending** date is set to the 
   anniversary **Date - 1** and the **Starting** date is set to the previous 
   month's anniversary day, or (3) otherwise the lot is skipped. [3]_ [4]_
#. If the account uses periodic recurring, (1) if the receiving flag is raised 
   and the account bills from starting balances then the **Ending** date is 
   left blank, else the **Ending** date is set to the calendar **Next** date, 
   and if the receiving flag is not raised, the lot anniversary **Starting** 
   date is set to the calendar date **Last + 1**. 

Once lot anniversary dates are set, transactions are selected for the lot (that 
is, by **Account**, **Product**, **Variety**, lot **Control**, and **Posted** 
date), and each lot is processed to determine balances.

#. Transactions **Received** prior to the lot anniversary **Starting** date are
   selected, and transaction quantities are summed to obtain the starting 
   balances for the lot. A starting balances array is stored.
#. If an **Ending** date is set then receiving transactions are selected with 
   **Received** date from the **Starting** date through the **Ending** date. 
   The transactions are summed and a received balances array is stored. 
#. In the same way as receiving, shipping and adjusting transactions are 
   selected, summed, and stored in shipped and adjusted arrays.
#. If a lot has zero balance at the **Starting** date, and no transactions 
   occur on or after the starting date, then the lot and all associated 
   transactions are set to **Archived** status and the lot is skipped. Lots 
   which have no transactions at all are deleted.

At this point, recurring audits and charges can be prepared for the lot. 

#. The rate **Group** is determined from the lot's **Product/Variety** 
   information, and the recurring per code (and the receiving per code, if the 
   receiving flag is raised) is used to determine the quantities to use for the 
   stock activity audit: Units, Packages, Inners, Net weight, Gross weight, or 
   DIM/Volume.
#. If the receiving calculation flag is raised, a receiving storage audit is 
   written using **Starting** balances for the receiving per code.
#. If recurring is calculated from **Starting** balances, and the receiving 
   flag is not raised, then a recurring storage audit is written using the 
   **Starting** balances for the recurring per code. 
#. If recurring is calculated from **Ending** balances or by **Anniversary**, 
   and the **Ending** date is not null, then a recurring storage audit is 
   written using the **Ending** balances for the recurring per code.
#. The inventory quantity accumulator array is updated with the lot quantities.

After calculating all the lots for a product, that is, when a product/variety 
break occurs, a recurring charge line is generated from the product accumulator 
array. If the account has free days, a separate charge line is generated for 
any received quantities. [5]_ Then the array is re-initialized for the next 
product. 

---------

.. rubric:: Footnotes

.. [1] Where a **Received** monthday falls at the end of a month, subsequent
       months which do not include the day will use the last day of the month 
       for the anniversary.

.. [2] A lot **Received** date is set to the **Posted** date unless the account
       has free days and the posting is from a receipt, in which case the lot 
       **Received** date is set to the transaction **Posted** date plus the 
       number of free days. 

.. [3] Section 5.c. of **INTERNATIONAL REFRIGERATED WAREHOUSE CONTRACT TERMS 
       AND CONDITIONS** states:

          *If storage rates are quoted on an “ANNIVERSARY BASIS” the storage 
          month shall extend from date of receipt in one calendar month to, but 
          not including, the same date of the next month.*

       This rule is applied to determine anniversary audit **Starting** and 
       **Ending** dates as follows:

       #. The calculation month and year is taken from the calendar **Next** 
          date. 
       #. The **Received** day is combined with the calendar **Next** month and 
          year to determine the next lot anniversary, although if the 
          **Received** month day is the first then the month is advanced one 
          month.
       #. An audit **Ending** date is calculated as the day preceding the 
          anniversary.
       #. If the lot is received after the first day of the current calendar 
          month it is skipped, and **Ending** is left blank.
       #. If the closed interval **[Last+1,Next]** does not contain the 
          **Ending** date, the lot is skipped and **Ending** is left blank. 
          (The calculation spans only part of the month, excluding this lot.) 
       #. Otherwise an audit **Starting** date is calculated as the anniversary 
          in the preceding month.

.. [4] Note that the contract defines **Anniversary** method recurring as by 
       calendar month. Accounts using Anniversary recurring must have a 
       calculation calendar which repeats monthly, which precludes having two 
       anniversary dates fall in the same calculation interval.

.. [5] A billing UOM is specified in the rate, separate from the inventory per 
       code. A factor or deficit formula is applied to inventory quantities to 
       calculate billing quantities, so that the amounts billed may not match 
       the exact inventory shown on the corresponding Stock Activity report.
