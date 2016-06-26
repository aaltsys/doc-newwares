.. _posting:

#############################
Transaction Activity
#############################

The following rules apply to transactions:

*  Transaction lines are written to an activity file. 
*  Each line references single values of product/variety, lot control, 
   unit identifier, and locator entries.
*  Quantities are signed (+/-) to indicate the effect of the transaction on 
   inventory.
*  Available = On-Hand + Reserve: Adding On-hand and Reserve transaction 
   quantities for a product, lot, unit, or location gives all available.
*  Selecting only transactions with condition G(ood) and adding On-hand and 
   Reserve will give shippable available products, lots, locations, or units.

Posting Status Codes
=============================

*  Posting :ref:`status-list` work in conjunction with Reserved and On-hand 
   quantities to manage Unit, Lot, and Product availability at the main database 
   level.
*  Reserved and Allocated shipments, and also Expected and In-transit receipts 
   all have Reserved quantity. 
*  A transaction line cannot be changed from Reserved to Allocated, or from 
   Expected to In-transit, without adding validated Unit and Lot information
   when it is required.
*  A transaction line may have either Reserved or On-hand quantity; not both.
   When an expected unit is received or an allocated unit is shipped, the 
   status changes to 3 and the quantity moves from Reserved to On-hand. 
*  All lines included on a document must change to a higher status level
   (e.g., moving from status 2 to 3) before the overall document status can 
   change to the higher status.

Table: Summary of status codes by document type.

+--------+---------------------------------------------------------------------+
|        |  --   Document Type -->                                             |
+--------+-------------+-------------+-------------+-------------+-------------+
| STATUS | 2 Ship Order| 3 Receiving | 4 Shipment  | 5 Adjustment| 6 Financial |
+========+=============+=============+=============+=============+=============+
|  -1    | Deleted     | Deleted     | Deleted     | Deleted     | Deleted     |
+--------+-------------+-------------+-------------+-------------+-------------+
|   0    | Data Error  | Unposted    | Unposted    | Unposted    | Unposted    |
+--------+-------------+-------------+-------------+-------------+-------------+
|   1    | Reserved    | Expected    | Reserved    | Reserved    | N/A         |
+--------+-------------+-------------+-------------+-------------+-------------+
|   2    | To Process  | In Transit  | Allocated   | Held/Alloc  | Entered     |
+--------+-------------+-------------+-------------+-------------+-------------+
|   3    | Processed   | On-Hand     | Shipped     | OnHand/Ship | Verified    |
+--------+-------------+-------------+-------------+-------------+-------------+
|   4    | Charged     | Charged     | Charged     | Charged     | Charged     |
+--------+-------------+-------------+-------------+-------------+-------------+
|   5    | Invoiced    | Invoiced    | Invoiced    | Invoiced    | Invoiced    |
+--------+-------------+-------------+-------------+-------------+-------------+
|   6    | Archived    | Archived    | Archived    | Archived    | Archived    |
+--------+-------------+-------------+-------------+-------------+-------------+

.. warning::
   Transactions are posted by line. However, all the lines of an entire document 
   must be posted before the status of the document can change to indicate the 
   document is posted. 

Posting Quantity Example
=============================

Following is an example set of transaction lines illustrating the effect of 
Inbound/Outbound (+/-), use of Reserve and On-hand, and Condition. 
In this example, transaction lines were selected and then sorted by
PRODUCT by VARIETY by CONTROL by UNITIDENTIFIER by TYPE by STATUS by POSTDATE.

.. tabularcolumns:: |L|L|R|L|L|L|L|L|L|R|R|R|

+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| TP| SS| POSTDATE  | PRODUCT | VAR| CONTROL  | UNIT ID  | C| UOM| ONHAND | RESERVED| COUNTPER|
+===+===+===========+=========+====+==========+==+=======+==+====+========+=========+=========+
| -- An expected (SS=1) Receipt may be reserved (SS=1) by a Shipment.                         |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| RE| 1 | 20150615TZ| PPPP    |    |          |          |  | CA |        |     54  |      54 |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| SH| 1 | 20150615TZ| PPPP    |    |          |          |  | CA |        |    -54  |      54 |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| -- An in-bound (SS=2) Receipt must have control numbers and unit identifiers.               |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| RE| 2 | 20150615TZ| PPPP    |    | CCCC     | 23456    |  | CA |        |     54  |      54 |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| -- An on-hand (SS=3) Receipt may be allocated (SS=2) to a Shipment in process.              |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| RE| 3 | 20150615TZ| PPPP    |    | CCCC     | 34567    | G| CA |     54 |         |      54 |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| SH| 2 | 20150615TZ| PPPP    |    | CCCC     | 34567    | G| CA |        |    -54  |      54 |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| -- Mixed units will have multiple package records which must be withdrawn by package.       |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| RE| 3 | 20150615TZ| PPPP    |    | CCCC     | 45678    | G| CA |     46 |         |      54 |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| RE| 3 | 20150615TZ| PPPP    |    | CCCC     | 45678    | D| CA |      8 |         |      54 |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| SH| 3 | 20150615TZ| PPPP    |    | CCCC     | 45678    | G| CA |    -46 |         |      54 |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+
| SH| 3 | 20150615TZ| PPPP    |    | CCCC     | 45678    | D| CA |     -8 |         |      54 |
+---+---+-----------+---------+----+----------+----------+--+----+--------+---------+---------+

.. note::
   *  +  **TP** column shows :ref:`document-list` entries RE(ceipt), SH(ipment),
         or AW(djustment). Actual values are "3", "4", and "5".
      +  **SS** column contains posting :ref:`status-list`.
      +  **C** column shows product :ref:`condition-list`.
   *  Inner quantity posting is omitted from the above example for clarity.
   *  Signed quantities: in-bound positive, outbound negative. 
   *  On-Hand + Reserve = Available.
   *  Status 1 -- For Expected/Reserved status, Control Numbers and Unit 
      Identifiers are optional and may be omitted.
   *  Status 2 -- In-Transit/Allocated requires Control entries when tracked
      by lot (C)ontrol, and both Control numbers and Unit IDs when tracked by 
      (U)nit.
