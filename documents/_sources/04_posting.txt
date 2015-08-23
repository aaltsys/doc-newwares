.. _posting:

#############################
Transaction Activity
#############################

Transactions are posted by line. The following rules apply to transactions:

*  Transaction lines are written to an activity file. 
*  Each line references a single product/variety, lot control, unit identifier, 
   and locator value.
*  Lines may contain either Reserved or On-Hand quantites, and quantities are 
   signed (+/-) indicating the effect of the transaction on inventory.
*  Available = On-Hand + Reserve: Adding On-hand and Reserve transaction 
   quantities for a product, lot, unit, or location gives all available.
*  Selecting only transactions with condition G(ood) and adding On-hand and 
   Reserve will give shippable available products, lots, locations. or units.

.. include:: ../codes/D_condition.rst

Posting Status Codes
=============================

*  Posting Status codes work in conjunction with Reserved and On-hand quantities 
   to manage Unit, Lot, and Product availability at the main database level.
*  Reserved and Allocated shipments, and also Expected and In-transit receipts 
   all have Reserved quantity. 
*  A transaction line cannot be changed from Reserved to Allocated, or from 
   Expected to In-transit, without adding validated Unit and Lot information.
*  A transaction line may have either Reserved or On-hand quantity; not both.
   When an expected unit is received or an allocated unit is shipped, the 
   status changes to 3 and the quantity moves from Reserved to On-hand.

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

Document Heading Requirements
=============================

+----------------+----------+----------+----------+----------+----------+----------+
| Column Name    | Expected |  Inbound | Received | Reserved | Allocated|  Shipped |
+================+==========+==========+==========+==========+==========+==========+
| TYPE           |        3 |        3 |        3 |        4 |        4 |        4 |
+----------------+----------+----------+----------+----------+----------+----------+
| IDENTIFIER     | sequence | sequence | sequence | sequence | sequence | sequence |
+----------------+----------+----------+----------+----------+----------+----------+
| REVISION       |      (1) |      (1) |      (1) |      (1) |      (1) |      (1) |
+----------------+----------+----------+----------+----------+----------+----------+
| STATUS         |        1 |        2 |       3+ |        1 |        2 |       3+ |
+----------------+----------+----------+----------+----------+----------+----------+
| DATETIME       |      (2) |      (2) |      (2) |      (2) |      (2) |      (2) |
+----------------+----------+----------+----------+----------+----------+----------+
| ACCOUNT        | required | required | required | required | required | required |
+----------------+----------+----------+----------+----------+----------+----------+
| BUILDING       |          |          | required |          | required | required |
+----------------+----------+----------+----------+----------+----------+----------+
| REFERENCECODE  |      (3) |      (3) |      (3) |      (3) |      (3) |      (3) |
+----------------+----------+----------+----------+----------+----------+----------+
| REFERENCE      |      (3) |      (3) |      (3) |      (3) |      (3) |      (3) |
+----------------+----------+----------+----------+----------+----------+----------+
| ADDRESSCODE    |       SF |       SF |       SF | ST   (4) | ST   (4) | ST   (4) |
+----------------+----------+----------+----------+----------+----------+----------+
| ADDRESS        | required | required | required | required | required | required |
+----------------+----------+----------+----------+----------+----------+----------+
| CONTACT        | optional | optional | optional | optional | optional | optional |
+----------------+----------+----------+----------+----------+----------+----------+
| CARRIERCODE    | optional | optional | optional | optional | optional | required |
+----------------+----------+----------+----------+----------+----------+----------+
| ROUTE          | optional | optional | optional | optional | optional | optional |
+----------------+----------+----------+----------+----------+----------+----------+
| FREIGHTPAY     |          |          |          | req'd (4)| req'd (4)| req'd (4)|
+----------------+----------+----------+----------+----------+----------+----------+
| other entries  | optional | optional | optional | optional | optional | optional |
+----------------+----------+----------+----------+----------+----------+----------+

.. note::
   #. REVISION version is incremented each time a transaction is posted.
   #. DATETIME, a required value, represents the expected date of completion for 
      Expected, Inbound, Reserved, Allocated. When status changes to Received or
      Shipped, DATETIME records the actual date and time of the change.
   #. Account settings determine REFERENCECODE defaults. Where REFERENCECODE 
      entries exist, the corresponding REFERENCE entries are required.
   #. When FREIGHTPAY shows 3rd party, a corresponding ADDRESSCODE of 'PF' and
      an address are required.

Document Line Requirements
=============================

+----------------+----------+----------+----------+----------+----------+----------+
| Column Name    | Expected |  Inbound | Received | Reserved | Allocated|  Shipped |
+================+==========+==========+==========+==========+==========+==========+
| SEQUENCEKEY    | sequence | sequence | sequence | sequence | sequence | sequence |
+----------------+----------+----------+----------+----------+----------+----------+
| UNITIDENTIFIER |          | required | required |          | required | required |
+----------------+----------+----------+----------+----------+----------+----------+
| TRANSACTIONTYPE|   3 or 5 |   3 or 5 |   3 or 5 |   4 or 5 |   4 or 5 |   4 or 5 |
+----------------+----------+----------+----------+----------+----------+----------+
| TRANSACTION    | (header) | (header) | (header) | (header) | (header) | (header) |
+----------------+----------+----------+----------+----------+----------+----------+
| LINEKEY        | sequence | sequence | sequence | sequence | sequence | sequence |
+----------------+----------+----------+----------+----------+----------+----------+
| STATUS         |        1 |        2 |       3+ |        1 |        2 |       3+ |
+----------------+----------+----------+----------+----------+----------+----------+
| POSTDATE       |      now |      now |      now |      now |      now |      now |
+----------------+----------+----------+----------+----------+----------+----------+
| LOCATION       |          |          | directed |          |   (unit) |   (unit) |
+----------------+----------+----------+----------+----------+----------+----------+
| CONDITION      |          |          | required | required |   (unit) |   (unit) |
+----------------+----------+----------+----------+----------+----------+----------+
| ACCOUNT        | (header) | (header) | (header) | (header) | (header) | (header) |
+----------------+----------+----------+----------+----------+----------+----------+
| PRODUCT        | required | required | required | required | required | required |
+----------------+----------+----------+----------+----------+----------+----------+
| VARIETY        | required | required | required | required | required | required |
+----------------+----------+----------+----------+----------+----------+----------+
| CONTROLCODE    |          | required | required |          |   (unit) |   (unit) |
+----------------+----------+----------+----------+----------+----------+----------+
| CONTROL        |          | required | required |          |   (unit) |   (unit) |
+----------------+----------+----------+----------+----------+----------+----------+
| DESCRIPTION    | [product]| [product]| [product]| [product]| [product]| [product]|
+----------------+----------+----------+----------+----------+----------+----------+
| UNITUOM        | (product)| (product)| (product)| (product)| (product)| (product)|
+----------------+----------+----------+----------+----------+----------+----------+
| UNITNET        | [product]| [product]| [product]| [product]|   (unit) |   (unit) |
+----------------+----------+----------+----------+----------+----------+----------+
| UNITTARE       | [product]| [product]| [product]| [product]|   (unit) |   (unit) |
+----------------+----------+----------+----------+----------+----------+----------+
| UNITSIZE       | [product]| [product]| [product]| [product]|   (unit) |   (unit) |
+----------------+----------+----------+----------+----------+----------+----------+
| UNITSTACK      | [product]| [product]| [product]| [product]|   (unit) |   (unit) |
+----------------+----------+----------+----------+----------+----------+----------+
| CONTENTUOM     | (product)| (product)| (product)| (product)| (product)| (product)|
+----------------+----------+----------+----------+----------+----------+----------+
| CONTENTONHAND  |          |          | required |          |          | required |
+----------------+----------+----------+----------+----------+----------+----------+
| CONTENTRESERVE | required | required |          | required | required |          |
+----------------+----------+----------+----------+----------+----------+----------+
| CONTENTNET     | [product]| [product]| [product]| [product]| [product]| [product]|
+----------------+----------+----------+----------+----------+----------+----------+
| CONTENTTARE    | [product]| [product]| [product]| [product]| [product]| [product]|
+----------------+----------+----------+----------+----------+----------+----------+
| CONTENTSIZE    | [product]| [product]| [product]| [product]| [product]| [product]|
+----------------+----------+----------+----------+----------+----------+----------+
| INNERUOM       | (product)| (product)| (product)| (product)| (product)| (product)|
+----------------+----------+----------+----------+----------+----------+----------+
| INNERONHAND    |      (3) |      (3) |      (3) |      (3) |      (3) |      (3) |
+----------------+----------+----------+----------+----------+----------+----------+
| INNERRESERVE   |      (3) |      (3) |      (3) |      (3) |      (3) |      (3) |
+----------------+----------+----------+----------+----------+----------+----------+
| INNERWEIGHT    |      (3) |      (3) |      (3) |      (3) |      (3) |      (3) |
+----------------+----------+----------+----------+----------+----------+----------+
| INNERSIZE      |      (3) |      (3) |      (3) |      (3) |      (3) |      (3) |
+----------------+----------+----------+----------+----------+----------+----------+

.. legend::
   #. (header), (product), and (unit) **parentheses** indicate unchanged values 
      copied from the respective source.
   #. [product] **brackets** indicate the source of a default value.
   #. If a product INNERUOM is null, associated INNER entries are prohibited. 
      Otherwise, INNERWEIGHT and INNERSIZE default to product values.
   #. INBOUND units can be reserved by outbound shipments. Upon receipt a unit 
      might be separately reserved as held or damaged. A rebalance routine might 
      not have enough inventory afterwards to account for the outbound RESERVE.

Posting Quantity Example
=============================

Following is an example set of transaction lines illustrating the effect of 
Inbound/Outbound (+/-), Posting to Reserve and On-hand, and Condition. 
In this example, transaction lines were selected and then sorted by
PRODUCT-VARIETY-CONTROL by UNIT-IDENTIFIER by TYPE by STATUS by DATETIME.

+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| -- Posting Control| -- Lot Identification -- | -- Unit -- --  | | -- Content -- -- -- --  |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| TP| SS| DATETIME  | PRODUCT | VAR| CONTROL   | IDENTIFIER| UOM| | UOM| C| ONHAND | RESERVE|
+===+===+===========+=========+====+===========+===========+====+=+====+==+========+========+
| -- An expected (SS=1) Receipt may be reserved (SS=1) by a Shipment.                       |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| 3 | 1 | 20150615TZ| PPPP    |    |           |           | PL | | CA |  |        |     54 |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| 4 | 1 | 20150615TZ| PPPP    |    |           |           | PL | | CA |  |        |    -54 |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| -- An in-bound (SS=2) Receipt must have control numbers and unit identifiers.             |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| 3 | 2 | 20150615TZ| PPPP    |    | CCCC      | 23456     | PL | | CA |  |        |     54 |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| -- An on-hand (SS=3) Receipt may be allocated (SS=2) to a Shipment in process.            |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| 3 | 3 | 20150615TZ| PPPP    |    | CCCC      | 34567     | PL | | CA | G|     54 |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| 4 | 2 | 20150615TZ| PPPP    |    | CCCC      | 34567     | PL | | CA | G|        |    -54 |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| -- Mixed units will have multiple content records which must be withdrawn by content.     |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| 3 | 3 | 20150615TZ| PPPP    |    | CCCC      | 45678     | PL | | CA | G|     46 |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| 3 | 3 | 20150615TZ| PPPP    |    | CCCC      | 45678     |    | | CA | D|      8 |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| 4 | 3 | 20150615TZ| PPPP    |    | CCCC      | 45678     | PL | | CA | G|    -46 |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+
| 4 | 3 | 20150615TZ| PPPP    |    | CCCC      | 45678     |    | | CA | D|     -8 |        |
+---+---+-----------+---------+----+-----------+-----------+----+-+----+--+--------+--------+

.. note::
   *  Inner quantity posting is omitted from the above example for clarity.
   *  Signed quantities: in-bound positive, outbound negative. 
   *  On-Hand + Reserve = Available.
   *  Status 1 -- For Expected/Reserved status, Control Numbers and Unit 
      Identifiers are optional and may be omitted.
   *  Status 2 -- In-Transit/Allocated requires Control and Unit ID information.
