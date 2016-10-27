.. _bill-charges:

#############################
Calculating Recurring Charges
#############################

Recurring is calculated across a date interval or period. The balances of 
active lots are determined for the start of the period, and the transaction 
activity completed within the period is then accumulated to determine an ending balance. 

Recurring is audited by comparing the ending balance of a lot in one period to
the starting balance in the succeeding period, and comparing the total of lot 
transactions in a period with the difference between starting and ending 
balances.
   
Recurring Calculation
=============================

While recurring selects multiple accounts to process in a batch, each account 
is calculated separately. This allows accounts which have outstanding issues to 
be skipped, while completing billing for other accounts. 

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
   || **Last + 1** starts calculation interval          |
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

#. If the account has free days [2]_, and if the **Received** date is within 
   the recurring interval, then the anniversary **Starting** date is set to the 
   free days expiration date, and a receiving calculation flag is raised.
#. If the account uses **Anniversary** recurring: (1) if the receiving flag is 
   raised then the **Ending** date is left blank, (2) if the lot anniversary 
   falls within the recurring interval then the anniversary **Ending** date is 
   set to that date and the **Starting** date is set to the previous 
   anniversary plus one day, or (3) otherwise the lot is skipped. [3]_
#. If the account uses calendar **Starting** or **Ending** recurring, then the 
   lot anniversary **Starting** date is set to the calendar date **Last + 1**, 
   and the **Ending** date is set to the calendar **Next** date.

Once lot anniversary dates are set, transactions are selected for the lot (that 
is, by **Account**, **Product**, **Variety**, lot **Control**, and **Posted** 
date), and each lot is processed to determine balances.

#. Transactions **Posted** prior to the lot anniversary **Starting** date are
   selected, and transaction quantities are summed to obtain the starting 
   balances for the lot. A starting balances array is stored.
#. If an **Ending** date is set then receiving transactions are selected with 
   **Posted** date from the **Starting** date through the **Ending** date. The 
   transactions are summed and a received balances array is stored. 
#. In the same way as receiving, shipping and adjusting transactions are 
   selected, summed, and stored in shipped and adjusted arrays.
#. If a lot has zero balance on the **Starting** date, and no transactions 
   occur on or after the starting date, then the lot and all associated 
   transactions are set to **Archived** status and the lot is skipped. Lots 
   which have no transactions at all are deleted.

At this point, recurring audits and charges can be prepared for the lot. 

#. The rate **Group** is determined from the lot's **Product/Variety** 
   information, and the recurring UOM (and the receiving UOM, if the account 
   has freedays) is used to determine the quantities to use for the audit:
   Units, Packages, Inners, Net weight, Gross weight, or Volume.
#. If the receiving calculation flag is raised, a receiving storage audit is 
   written using the **Starting** balances of the receiving billing UOM.
#. If recurring is calculated from **Starting** balances, and the receiving 
   flag is not raised, then a recurring storage audit is written using the 
   **Starting** balances and the recurring billing UOM. 
#. If recurring is calculated from **Ending** balances or by **Anniversary**, 
   and the **Ending** date is not null, then a recurring storage audit is 
   written using the **Ending** balances and the recurring UOM.
#. The inventory quantity accumulator array is updated with the lot quantities.

After calculating all the lots for a product, that is, when a product/variety 
break occurs, a recurring charge line is generated from the product accumulator 
array. If the account has free days, a separate charge line is generated for 
any received quantities. Then the array is re-initialized for the next product.

.. [1] Where a **Received** monthday falls at the end of a month, subsequent
       months which do not include the day will use the last day of the month 
       for the anniversary.

.. [2] A lot **Received** date is set to the **Posted** date unless the account
       has free days, in which case the lot **Received** date is set to the 
       transaction **Posted** date plus the number of free days. 
       
.. [3] **Anniversary** method recurring calendars must preclude having two 
       anniversary dates fall in the same calculation interval.

Minimum Recurring Invoice
=============================

To avoid expending warehouse resources on non-performing accounts, a warehouse 
may impose a recurring invoice minimum charge. The procedure for setting up 
this charge is shown in the following example.

On the **Rates** page, enter a new rate record as follows:

.. image:: _images/rate-faq1-id.png

This rate will be evaluated as each invoice is generated for account **ABF**. 
The quantity method **recurMinimum** will select all invoice lines with code 
**1S** and this invoice number, and sum the extended column to determine an 
amount. Method logic will return **Amount = 0** when recurring exceeds 250.00, 
or when an invoice has no recurring charges. 

.. image:: _images/rate-faq1-calc.png

In the calculation part of the rate setup, the **Factor**, **Rate**, and 
**Quantity** are all **1.00**, and the **Minimum** is the minimum amount of 
recurring to charge, if any.

Applying the rate as shown will result in adding a deficit charge line to an 
invoice provided the recurring total is greater than zero, but less than 
$250.00.
