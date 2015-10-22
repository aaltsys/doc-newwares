.. _products:

#############################
Product Data Definition 
#############################

Product record entries are divided into the following sections:

*  Keys & Descriptors-- The entries which uniquely identify a product, and
   any alternate textual product identification and description
*  Classification & Valuation -- Categorization and classification codes, 
   including associated billing rates and product declared value
*  Dimension -- The measures of packing for a product
*  Location -- Information which controls location of items
*  Notes and Messages -- Optional product notes information

Product Masterfile Columns
=============================

+---+---+----------------+-----+---+----------------------+--------+-----+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE              | DEFAULT| JUST| NOTE|
+===+===+================+=====+===+======================+========+=====+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys and Descriptions                    |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | ACCOUNT        | A   | U | VT=ACCOUNTS          |        | L10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | IDENTIFIER     | AN  | U |                      |        | L20 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | VARIETY        | AN  | U |                      | null   | L10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | MA| PRODUCTCODE    | LC  | U | :ref:`product-list`  |        | L4  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | MA| PRODUCT        | AN  | U | paired: PRODUCTCODE  |        | L20 | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | HAZARDOUS      | B   |   | (X,null)             |        | L1  | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | DESCRIPTION    | T   |   |                      |        | T40 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | PACKAGING      | T   |   |                      |        | L40 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | SHIPPINGNAME   | T   |   |                      |        | L40 | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Category Entries                         |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | TRACKCODE      | LC  | U | :ref:`track-list`    | C      | L4  | [6]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTROLCODE    | LC  | U | :ref:`control-list`  | NA     | L4  | [7]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | RATE           | A   | U | VT=RATES             |        | L8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | MA| FREIGHTCODE    | LC  | U | :ref:`freight-list`  |        | L4  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | MA| FREIGHTCLASS   | AN  | U | paired: FREIGHTCODE  |        | L10 | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | SA| VALUEPER       | LC  | U | :ref:`per-list`      |        | L4  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | SA| VALUE          | N.2 |   | paired: VALUEPER     |        | R8  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | SA| COSTPER        | LC  | U | :ref:`per-list`      |        | L4  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | SA| COST           | N.2 |   | paired: COSTPER      |        | R8  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | MA| GROUPCODE      | LC  | U | :ref:`group-list`    |        | L4  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | MA| GROUPING       | AN  | U | paired: GROUPCODE    |        | L20 | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Dimension Entries                        |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | WEIGHTUOM      | LC  | U | :ref:`wtm-list`      | LB     | L4  | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | DIMUOM         | LC  | U | :ref:`dim-list`      | CF     | L4  | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERUOM       | LC  | U | :ref:`uom-list`      | EA     | L4  | [3]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | INNERCOUNT     | N.0 |   | (MD0)                |        | R6  | [3]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERWEIGHT    | N.4 |   | (MD4)                |        | R6  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERSIZE      | N.4 |   | (MD4)                |        | R6  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | CONTENTUOM     | LC  | U | :ref:`uom-list`      | CA     | L4  | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | CONTENTCOUNT   | N.0 |   | (MD0)                |        | R6  | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | CONTENTNET     | N.4 |   | (MD4)                |        | R6  | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTTARE    | N.4 |   | (MD4)                |        | R6  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | CONTENTSIZE    | N.4 |   | (MD4)                |        | R6  | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTLONG    | N.4 |   | (MD4)                |        | R6  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTWIDE    | N.4 |   | (MD4)                |        | R6  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTHIGH    | N.4 |   | (MD4)                |        | R6  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | UNITUOM        | LC  | U | :ref:`uom-list`      | PL     | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITNET        | N.2 |   | (MD2)                |        | R8  | [5]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITTARE       | N.2 |   | (MD2)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITSIZE       | N.4 |   | (MD4)                |        | R8  | [5]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITSTACK      | N.0 |   | (MD0)                |        | R2  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Location Entries                         |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | ABC            | LC  | U | :ref:`abc-list`      |        | L2  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | MIX            | LC  | U | :ref:`mix-list`      |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | ZONE           | LC  | U | :ref:`zone-list`     |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | SLOT           | A   | U | VT=LOCATIONS         |        | L10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Notes and Messages Entries               |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | MA| NOTECODE       | LC  | U | :ref:`note-list`     |        | L4  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | MA| NOTE           | T   |   | paired: NOTECODE     |        | L80 | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| CO| MA| NOTEAPPLY      | LC  | U | :ref:`noteapply-list`|        | L4  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+

.. [1] When hazardous is marked (X), entries are required for: SHIPPNGNAME, 
       WEIGHTUOM, DIMUOM, CONTENTUOM, CONTENTCOUNT, CONTENTNET, and CONTENTSIZE.
.. [2] Paired entries are required when the corresponding codes are entered.
.. [3] When a UOM is specified for inners or content, then a corresponding COUNT 
       is required, and INNERCOUNT must be greater than 1.
.. [4] Entering INNERWEIGHT or INNERSIZE will set the following default values:
       * CONTENTNET = INNERCOUNT * INNERWIEGHT and 
       * CONTENTSIZE = INNERCOUNT * INNERSIZE.
.. [5] Entries for CONTENTNET, CONTENTTARE, and CONTENTSIZE set default values:
       * UNITNET = CONTENTCOUNT * ( CONTENTNET + CONTENTTARE ) and
       * UNITSIZE = CONTENTCOUNT * CONTENTSIZE.
.. [6] TRACKCODE determines the level of inventory tracking information required
       to post transaction lines to STATUS=2 and above. Options are:
       * **P** Lot control is ignored, all product is fungible.
       * **C** Requires control numbers, all product within a lot is fungible.
       * **U** Storage unit numbers are required for tracking.
.. [7] When CONTROLCODE is entered, it becomes a mandatory value on lots
       associated with this product. Control codes may determine default values
       for lot control, such as rotation date or warehouse lot sequences. 
       CONTROLCODE cannot be set if TRACKCODE = "P".

.. include:: ../resources/legend.rst

.. warning::
   The following WARES product setup entries are not yet supported in webWARES:
   DATES, LIFE, REPACK, PICK_MIN and PICK_QTY, ORDER_MIN and ORDER_QTY.
