.. _bill-recurring:

#############################
Recurring Calculation Audits
#############################

Recurring Reports
=============================

Recurring calculations produce two audit trails. The :ref:`bill-activity` 
details inventory stock movement during the recurring period, resulting in a 
quantity balance to be billed. The :ref:`bill-storage` lists charges billed for
the quantity balance.

The customer should receive both reports with the recurring storage invoice, 
one report for inventory management and the other for accounting.

.. note::
   Inventory may be tracked by unit, lot, or product, but the stock activity is 
   reported by lot or product using the units of the storage charges. Then 
   charges are summarized and reported by product only.

.. _bill-storage:

Recurring Charges Audits
-----------------------------

Recurring charges are always audited with the *Charges Summary* report, as 
shown following. 

.. image:: _images/audit-recurring.png

.. note::
   Each row of this report lists charges for one product identifier/variety 
   combination. The **Activity** column contains the product identifier; the
   **Description** shows the product description, not the charge description. 

.. _bill-activity:

Stock Activity Audits
-----------------------------

Billing quantities for stock activity and balances are captured with the 
**Stock Activity Audit**. This report is divided into two sections: identifying 
information for each item on the left, and quantitative data on the right.

Example identifying information for the Stock Activity follows:

.. image:: _images/audit-activity1.png

Columns for the report identifier section are:

+-----------------+------------------------------------+
| Column Name     | Description                        |
+=================+====================================+
| AUDIT           | (heading) Calculation Batch Number |
+-----------------+------------------------------------+
| RUN DATETIME    | (heading) Date Time batch started  |
+-----------------+------------------------------------+
+-----------------+------------------------------------+
| ACCOUNT         | Customer Account Code              |
+-----------------+------------------------------------+ 
| UOM             | Billing Quantity Unit of Measure   |
+-----------------+------------------------------------+
| PRODUCT         | Product Code Identifier            |
+-----------------+------------------------------------+
| VARIETY         | Variety Code, if used              |
+-----------------+------------------------------------+
| LOT             | When tracking lots, the Lot Number |
+-----------------+------------------------------------+

AUDIT and RUN datetime apply to the entire report, and so these items appear in 
the report identifier section heading.

The Quantitative data listed below matches the identifiers section presented 
above:

.. image:: _images/audit-activity2.png

Again, calculation range STARTING and ENDING apply to the entire report and so 
these items appear in the data section heading. All data columns are listed 
below.

+-----------------+------------------------------------+
| Column Name     | Description                        |
+=================+====================================+
| RANGE STARTING  | (heading) Calculation Batch Number |
+-----------------+------------------------------------+
| RANGE ENDING    | (heading) Date Time batch started  |
+-----------------+------------------------------------+
+-----------------+------------------------------------+
| START DATE      | Lot Anniversary Starting Date      |
+-----------------+------------------------------------+ 
| ON HAND         | Lot Balance on Starting Date       |
+-----------------+------------------------------------+
| RECEIVED        | Quantity Received during Period    |
+-----------------+------------------------------------+
| SHIPPED         | Quantity Shipped during Period     |
+-----------------+------------------------------------+
| ADJUSTED        | Quantity Adjusted during Period    |
+-----------------+------------------------------------+
| ENDING BALANCE  | Lot Balance at Period Ending Date  |
+-----------------+------------------------------------+
| END DATE        | Anniversary Period Ending Date     |
+-----------------+------------------------------------+

Calculating Recurring Charges
=============================

Recurring charges are based on a **Stock Activity Audit**. This report is a 
permanent record of the inventory changes during a recurring period, resulting 
in the balances used for recurring charges. The Stock Activity Audit determines
the starting balance of inventory, accumulates transactional changes from 
receiving, shipping, and adjusting, and calculates a corresponding inventory 
ending balance. 

Recurring Activity Issues
=============================

Several factors can complicate recurring storage calculations:

*  The units of measure for recurring storage can be different from the stock 
   units which track inventory movement.
*  Recurring may be based on calendar periods, or on lot anniversaries.
*  Accounts may specify custom period dates for recurring accounting. 
*  Recurring may be calculated by month, or by alternative time periods such as 
   daily, weekly, or bi-weekly.
*  Inventory movement may be tracked by unit, lot, or product.
*  Accounts may be offered free days affecting the starting date for applying 
   storage charges or calculating anniversaries, as well as requiring the 
   accumulation of both receiving and recurring charges during recurring 
   calculation.

*  Damaged goods are included in recurring storage but not reported in available
   inventory.

Calculation Requirements.

Recurring Process
-----------------------------

Recurring selects inventory lots by account by rate group by product by lot. 
First the :ref:`inv-balances` is created for the selected inventory records, 
then a recurring charges record is created for the balance of each product or 
lot being tracked.
Recurring is calculated by 
selecting accounts from the recurring calendar list, then calling a routine to 
create an inventory activity audit and apply recurring storage charges to the 
resulting ending balances.
