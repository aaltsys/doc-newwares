.. _lots:

#############################
Inventory Lot Details
#############################

Lot detail record entries are divided into the following sections:

*  Keys -- A combination of values which uniquely identify a product
*  Descriptors -- Alternate textual product identification and categorization
*  Dimension -- The measures of packing for a product
*  Transactions -- keys, Posting, Lot Identification, and quantitative entries.

.. note::
   The following WARES product setup entries are not yet supported in webWARES:
   DATES, LIFE, REPACK, PICK_MIN and PICK_QTY, ORDER_MIN and ORDER_QTY.

Detail Lot Header Columns
=============================

+---+---+----------------+-----+---+----------------------+--------+-----+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE              | DEFAULT| JUST| NOTE|
+===+===+================+=====+===+======================+========+=====+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys                                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | ACCOUNT        | A   | U | VT=ACCOUNTS          |        | L10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | PRODUCT        | A   | U | VT=PRODUCTS, key1    |        | L20 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | VARIETY        | A   | U | VT=PRODUCTS, key2    | null   | L10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CONTROLCODE    | LC  | U | :ref:`control-list`  | NA     | L4  | [A]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CONTROL        | A   | U |                      |        | L20 | [A]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Descriptive Entries                      |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | REVISION       | A   | U |                      | 00     |     |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | POSTDATE       | A   | U | DATE                 | TODAY  | R10 | [A]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | T | DESCRIPTION    | A   |   |                      |        | T40 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| [B]_  -- -- -- -- -- -- -- -- -- -- Dimensional Entries                      |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | UNITUOM        | A   | U | :ref:`uom-list`      | PL     | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITNET        | N.2 |   | (MD2)                |        | R9  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITTARE       | N.2 |   | (MD2)                |        | R9  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITSIZE       | N.2 |   | (MD4)                |        | R9  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITSTACK      | N.0 |   | (MD0)                |        | R1  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTUOM     | A   | U | :ref:`uom-list`      | CA     | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTCOUNT   | N.0 |   | (MD0)                |        | R6  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTNET     | N.4 |   | (MD4)                |        | R9  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTTARE    | N.4 |   | (MD4)                |        | R9  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTSIZE    | N.4 |   | (MD4)                |        | R9  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERUOM       | A   | U | :ref:`uom-list`      | EA     | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERCOUNT     | N.0 |   | (MD0)                |        | R6  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERWEIGHT    | N.4 |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERSIZE      | N.4 |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+

.. [A] CONTROLCODE may be assigned automatically based on the associated product 
       record. Control codes may determine the default values of control, such 
       as rotation dates or warehouse sequential lot numbers.
.. [B] Defaults for lot dimensional values are copied from product entries when
       a document is entered. These values may be changed during document entry.

.. include:: ../resources/legend.rst

.. include:: 05_lines.rst
