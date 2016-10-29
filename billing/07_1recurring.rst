.. _bill_recurring:

#############################
Recurring Storage Billing
#############################

Charging customers for using warehouse space is a fundamental part of warehouse operations. A customer may contract to lease a portion of a building at a fixed 
price, but the more common practice, supported by law and contract, is to 
charge a periodic recurring storage fee for each unit of product on hand.

Recurring Calendars
=============================

Each customer account requires a calendar to schedule recurring storage 
calculations. While it is customary to calculate recurring on the last day of 
each calendar month, recurring can be calculated on other schedules. 

WARES can perform the recurring billing at any time. When the recurring process 
is selected, WARES first displays a list of recurring calendars to use. This 
list displays all the calendar schedules with a calculation **Next** date less 
than or equal to the current recurring run date. Recurring calendars with dates 
following the recurring batch **Run** date are not displayed and cannot be run. 

.. sidebar:: Recurring date descriptors 

   To avoid confusion, this reference table lists the variety of date names and 
   their sources which are used in recurring calculations.

   +-----------+--------------+-----------------------+
   | Date Name | Source       | Description           |
   +===========+==============+=======================+
   | RUN       | Calculation  | Calculation run date  |
   +-----------+--------------+-----------------------+
   | LAST      | Calendar     | Date last executed    |
   +-----------+--------------+-----------------------+
   | NEXT      | Calendar     | Next execution date   |
   +-----------+--------------+-----------------------+
   | POSTED    | Transaction  | Inventory changed     |
   +-----------+--------------+-----------------------+
   | ENTERED   | Transaction  | Date/Time of entry    |
   +-----------+--------------+-----------------------+
   | STARTING  | Lot date     | Set for lot in audit  |
   +-----------+--------------+-----------------------+
   | ENDING    | Lot date     | Set for lot in audit  |
   +-----------+--------------+-----------------------+
   | RECEIVED  | Audits       | POSTED + Freedays     |
   +-----------+--------------+-----------------------+

Recurring Calculation Methods
=============================

Recurring storage is determined either by periods or by the monthly anniversary 
of the day lots are received, as described following:

Periodic Recurring
-----------------------------

Where an account's recurring balances are calculated by period, all lots for 
the account will use the same anniversary starting and ending dates, which are 
determined by the account's recurring calendar. The lot anniversary 
**Starting** date will be one day greater than the **Last** date of the 
account's recurring calendar, and the **Ending** date will be the **Next** date 
of the account's calendar.

Once lot balances are calculated, there are two options for determining charges 
with period recurring: using ending balances (advance billing), or using 
starting balances (arrears billing). There are a few southern warehouses still 
clinging to arrears billing, and so WARES supports this deprecated business 
method. 

Anniversary Recurring 
-----------------------------

Where balances are calculated by anniversary, the lot anniversary **Ending** 
date will be the anniversary month day which falls within the calendar 
**Last+1** to **Next** interval. The lot's anniversary **Starting** date will 
be the equivalent day in the previous month.

When using anniversary method, the recurring calendar must be monthly, but the 
month may be divided up into weeks or other intervals. When only a portion of a 
month is calculated, only lots with anniversaries within that portion will 
be included in the calculation.

Anniversaries and Freedays
-----------------------------

.. sidebar:: Freedays and anniversary dates

   Since months do not all have the same number of days, this chart shows how 
   anniversaries are determined from month to month.

   +----------+------+--------------+------------------+
   | Posted   | Free | Received     | Next anniverary  |
   +==========+======+==============+==================+
   | Jan 28   | 0    | January 28   | February 28      |
   +----------+------+--------------+------------------+
   | Jan 29   | 0    | January 29   | February LAST    |
   +----------+------+--------------+------------------+
   | Jan 15   | 15   | January 30   | February LAST    |
   +----------+------+--------------+------------------+
   | Feb 26   | 3    | March 1      | April 1          |
   +----------+------+--------------+------------------+
   || Feb 26  || 3   || Feb 29      || March 29        |
   ||         ||     || (leap year) |                  |
   +----------+------+--------------+------------------+

Anniversaries are calculated from the date a lot of goods is **Received** into 
the warehouse. When an account has free days, the free days add to the 
transaction **Posted** date to determine the **Received** date. 

When an account has freedays and a lot's **Received** date falls within the 
recurring calculation interval, the lot **Starting** date is set to the 
**Received** date and receiving storage is applied to the corresponding 
starting balances. And since the **Received** date is used as the **Starting** 
date, transactions posted prior to the **Starting** date are excluded from a 
recurring audit. 

Also, when the **Starting** date is the **Received** date, the **Ending** date 
is left blank, since it will be processed in the next month. Put another way, 
when anniversary storage is used, receiving and recurring charges for a lot 
cannot occur in the same month. First goods are **Received**, and then 
anniversaries are used for the lot **Ending** date and recurring storage is 
applied in subsequent months. 

Periodic Method and Freedays
-----------------------------

When freedays expire with periodic recurring, The **Received** date is used for 
the **Starting** date, and starting balances are used to calculate receiving 
storage. Hence when freedays expire in periodic recurring, a lot's calculation 
**Starting** date will not be the beginning of the recurring period.

For lots received with freedays, if the periodic storage is based on starting 
balances, then the **Ending** date is left blank and no recurring is calculated 
for the lot. When periodic storage is calculated from ending balances, the 
**Ending** date is filled and ending balances are used to calculate recurring 
as usual.
