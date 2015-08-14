.. _posting:

#############################
Transaction Posting
#############################

Transaction lines post to the locator based on a post-write database trigger.
Each transaction line refers to a single locator entry. The post process 
collects all lines associated with a locator entry, and then adds the signed 
quantities to determine total locator entry quantities. 

Posting
=============================

Summary of document posting by status:
+--------+---------------------------------------------------------------------+
|        |  --  --  --  --  --  --  - Document Type -  --  --  --  --  --  --  |
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
|   3    | Processed   | Received OH | Shipped     | OH/ Shipped | Verified    |
+--------+-------------+-------------+-------------+-------------+-------------+
|   4    | Charged     | Charged     | Charged     | Charged     | Charged     |
+--------+-------------+-------------+-------------+-------------+-------------+
|   5    | Invoiced    | Invoiced    | Invoiced    | Invoiced    | Invoiced    |
+--------+-------------+-------------+-------------+-------------+-------------+
|   6    | Archived    | Archived    | Archived    | Archived    | Archived    |
+--------+-------------+-------------+-------------+-------------+-------------+

.. note::
   *  Signed quantities: in-bound positive, outbound negative. 
   *  Result: On-Hand + Reserve = Available.
   *  Status 1 -- Expected is entered by product without Control and Identifier.
   *  Status 2 -- In-Transit requires Control and Unit ID information.
   *  Goods with condition issues may be shown or hidden by selection. 

.. insert:: ../codes/S_document.rst

.. insert:: ../codes/D_condition.rst

Posting Example
=============================

Sorted by PRODUCT-VARIETY-CONTROL-IDENTIFIER by TYPE by STATUS by DATETIME.

+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
|  Posting Control  |   Lot Identification     |   Unit         | |   Content               | |   Inner              |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| TP| SS| DATETIME  | PRODUCT | VAR| CONTROL   | IDENTIFIER| UOM| | UOM| C| ON-HAND| RESERVE| | UOM| ON-HAND| RESERVE|
+===+===+===========+=========+====+===========+===========+====+=+====+==+========+========+=+====+========+========+
| -- An expected (SS=1) Receipt may be reserved (SS=1) by a Shipment.                                                |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| 3 | 1 | 20150615TZ| PPPP    |    | CCCC      |           | PL | | CA | G|        |     54 | |    |        |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| 4 | 1 | 20150615TZ| PPPP    |    | CCCC      |           | PL | | CA | G|        |    -54 | |    |        |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| -- An in-bound (SS=2) Receipt must have control numbers and unit identifiers.                                      |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| 3 | 2 | 20150615TZ| PPPP    |    | CCCC      | 23456     | PL | | CA | D|        |     54 | |    |        |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| -- An on-hand (SS=3) Receipt may be allocated (SS=2) to a Shipment in process.                                     |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| 3 | 3 | 20150615TZ| PPPP    |    | CCCC      | 34567     | PL | | CA | G|     54 |        | |    |        |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| 4 | 2 | 20150615TZ| PPPP    |    | CCCC      | 34567     | PL | | CA | G|        |    -54 | |    |        |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| -- Multiple content records will exist for a mixed unit, which must be withdrawn by similar records.               |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| 3 | 3 | 20150615TZ| PPPP    |    | CCCC      | 45678     | PL | | CA | G|     46 |        | |    |        |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| 3 | 3 | 20150615TZ| PPPP    |    | CCCC      | 45678     |    | | CA | D|      8 |        | |    |        |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| 4 | 3 | 20150615TZ| PPPP    |    | CCCC      | 45678     | PL | | CA | G|    -46 |        | |    |        |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+
| 4 | 3 | 20150615TZ| PPPP    |    | CCCC      | 45678     |    | | CA | D|     -8 |        | |    |        |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+-+----+--------+--------+

INBOUND:
=============================
   
   *  Choice of entering from order, or from ASN
   *  Unit lines added to locator on status INBOUND
   *  Units can be RESERVED, cannot be allocated
   *  Order required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = EXPECTED
      |  DATETIME
      |  STATUS_CODE = INBOUND
      |  PRODUCT
      |  WEIGHTS & MEASURES  (multiple entries)
      |  CONTENTS (multiple entries)
   
   *  ASN required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = EXPECTED
      |  DATETIME
      |  STATUS_CODE = INBOUND
      |  PRODUCT
      |  UNIT_IDENTIFIER
      |  CONTROL_CODE
      |  CONTROL_LOT
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)

RECEIPT:
=============================

   *  Choice of completing an order, an ASN, or entering from scratch
   *  Unit lines updated or added to locator on status AVAILABLE, HELD, DAMAGED
   *  DOCUMENT array updated to have INBOUND and RECEIPT
   *  Receipt required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = RECEIVED
      |  DATETIME
      |  STATUS_CODE = AVAILABLE, HELD, DAMAGED
      |  PRODUCT
      |  UNIT_IDENTIFIER
      |  CONTROL_CODE
      |  CONTROL_LOT
      |  LOCATION
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
   .. note: 
      An INBOUND unit could be reserved, but upon receipt the unit might be 
      HELD or DAMAGED. A rebalance routine might not have enough inventory 
      afterwards to account for the RESERVE.
   
OUTBOUND:
=============================

   *  Entered, received as Warehouse Order (940), or JSON import
   *  Lines added to locator as RESERVED, deducting from AVAILABLE
   *  Order required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = RESERVED
      |  DATETIME
      |  STATUS_CODE = RESERVED
      |  PRODUCT
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
SHIPMENT:
=============================

   *  Choice of completing an outbound order, or entering from scratch
   *  AVAILABLE (scratch entry) or RESERVED (outbound completion) lines updated 
      to ALLOCATED
   *  DOCUMENT array updated to have OUTBOUND and SHIPMENT
   *  Shipment required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = SHIPPED
      |  DATETIME
      |  STATUS_CODE = SHIPPED
      |  PRODUCT
      |  UNIT_IDENTIFIER
      |  CONTROL_CODE
      |  CONTROL_LOT
      |  LOCATION
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
ADJUSTMENT: 
=============================
