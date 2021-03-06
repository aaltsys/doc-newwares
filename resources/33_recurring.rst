.. _recurring-schema:

#############################
RECURRING Lines Data Columns
#############################

+---+---+----------------+-----+---+----------------------+--------+-----+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE              | DEFAULT| JUST| NOTE|
+===+===+================+=====+===+======================+========+=====+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys                                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | LINEKEY        | SK  | U | sequenced            |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | BATCH          | N   | U |                      |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | ACCOUNT        | A   | U | VT=ACCOUNTS          |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | PRODUCT        | A   | U | VT=PRODUCTS          |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | VARIETY        | A   | U | VT=PRODUCTS          |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CONTROL        | A   | U | VT=LOTS              |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | POSTED         | DT  | U | DATETIME             |        | R16 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Calculation Control Entries              |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | RECEIVED       | DT  | U | DATETIME             |        | R16 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | RUNDATE        | DT  | U | DATETIME             | NOW    | R16 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | LAST           | DT  | U | DATETIME             |        | R16 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | NEXT           | DT  | U | DATETIME             |        | R16 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Audit Entries                            |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | STARTING       | DT  | U | DATETIME             | LAST+1 | R16 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | QTY_ONHAND     | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | QTY_RECEIVED   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | QTY_SHIPPED    | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | QTY_ADJUSTED   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | QTY_BALANCE    | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | ENDING         | DT  | U | DATETIME             |        | R16 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Rate Entries                             |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | T | GROUP          | A   | U | VT=RATES             |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | T | SERVICE        | LC  | U | (services list)      |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | PERCODE        | LC  | U | :ref:`per-list`      |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | BILLUOM        | LC  | U | :ref:`uom-list`      |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | FACTOR         | N.4 | U |                      |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | QUANTITY       | N.4 | U |                      |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | DEFICIT        | N.4 | U |                      |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | RATE           | N.4 | U |                      |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CHARGE         | N.4 | U |                      |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Quantitative Entries                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | OH_UNITS       | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | OH_PACKAGES    | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | OH_INNERS      | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | OH_NETWEIGHT   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | OH_GROSSWEIGHT | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | OH_DIMVOLUME   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | RC_UNITS       | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | RC_PACKAGES    | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | RC_INNERS      | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | RC_NETWEIGHT   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | RC_GROSSWEIGHT | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | RC_DIMVOLUME   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | SH_UNITS       | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | SH_PACKAGES    | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | SH_INNERS      | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | SH_NETWEIGHT   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | SH_GROSSWEIGHT | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | SH_DIMVOLUME   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | AJ_UNITS       | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | AJ_PACKAGES    | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | AJ_INNERS      | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | AJ_NETWEIGHT   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | AJ_GROSSWEIGHT | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | AJ_DIMVOLUME   | N.4 |   | (MD4L)               |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+

.. include:: ../resources/legend.rst

 
