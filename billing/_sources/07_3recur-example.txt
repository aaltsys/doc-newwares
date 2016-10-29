.. _bill-recur-example:

#############################
Recurring Issues and Examples
#############################

Many warehousing programs which attempt to calculate billing are yet unable to 
produce a correct bill combining anniversary method with freedays. Fortunately 
there is WARES. Examples provided here address this and many other issues with 
storage billing, activity reconciliation, and more.

(Screen shots and transaction details to be added later.)

Tracking 
=============================

Inventory tracking may be by unit, lot, or product. Recurring billing depends 
on the received date for goods, independent of the tracking method. 

Inventory Reconciliation
=============================

Damaged goods included in recurring storage are not reported in available 
inventory. 

Arrears Corrections
=============================

Transactions may be posted in arrears, including to previous months, to correct 
errors such as: receiving to a wrong product code, receiving an incorrect lot 
number, recording hidden damage, transferring ownership, and similar problems. 

When a correction entered today is posted into a calculated period, then the 
starting balances of new recurring activity will not match the ending balances 
from the previous period. Specifically, transactions may create a recurring 
audit discrepancy when the span between **Posted** and **Entered** dates cross 
a recurring period boundary, and the **Entered** datetime is after the previous 
recurring calculation **Run** datetime.

When auditing recurring, transactions are selected for **Posted** (or 
**Received**) dates within the period and then sorted by **Entered** datetime. 
Knowing the **Run** datetime for the calculation, out of period transaction 
exceptions can be identified and accounted for.

Units of Measure
=============================

The units of measure for billing storage and handling can be different from the 
stock units for inventory movement. 

Recurring Methods
=============================

Recurring may be based on calendar periods, or on lot anniversaries. 

Free Days
=============================

Accounts may be offered free days affecting the starting date for applying 
storage charges or calculating anniversaries, as well as requiring the 
accumulation of both receiving and recurring charges during recurring 
calculation. 

Custom Periods
=============================

Accounts may require a warehouse to use their proprietary calendar period dates 
for reconciling inventory and calculating charges. 

Recurring may be calculated by month, or by alternative time periods such as 
daily, weekly, or bi-weekly. 

Specifically with anniversary billing, monthly charges for recurring storage 
may be calculated incrementally throughout the month depending on **Received** 
dates.
