.. _documents:

#############################
Inventory Documents
#############################

Standard warehousing business documents record, maintain, and communicate 
inventory data in WARES. These documents also form the basis of data exchange 
with business trading partners, either through EDI, via direct exchange of JSON 
data, or using custom data import routines. EDI titles and document codes are
listed in :ref:`codes:document-list`.

WARES stores all documents in a single database table. This means that all 
documents share a common data definition, although documents present information 
in views according to their purpose. Each document has a header section, and
repeating transaction line detail. 

.. _dochead:

Header Columns
=============================

Data entries in the document head occur once per transaction. Some entries may
contain multiple values. Columns are defined in the table following.

+---+---+----------------+-----+---+------------------------+--------+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE                | DEFAULT| JUST|
+===+===+================+=====+===+========================+========+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys                                 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| M | S | TYPE           | LC  | U | :ref:`document-list`   |        | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| M | S | IDENTIFIER     | SK  | U |                        |        | L12 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| M | S | REVISION       | S   | U |                        |[1]_    | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Posting & Reference                  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| M | S | STATUS         | LC  | U | :ref:`status-list`     |        | L2  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| M | S | DATETIME       | D   | U |                        | TODAY  | R10 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| M | S | ACCOUNT        | A   | U | VT=ACCOUNTS            |        | L12 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| O | S | BUILDING       | A   | U | VT=CONTACTS*B          |        | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| REFERENCECODE  | LC  | U | :ref:`reference-list`  |        | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| REFERENCE      | A   |   |                        |        | L20 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Transportation                       |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| ADDRESSCODE    | LC  | U | :REF:`contact-list`    | ST,SF  | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| ADDRESS        | A   | U | VT=CONTACTS*ST,SF,PF   |        | L12 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| O | S | CONTACT        | A   |   |                        |        | L20 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| O | S | CARRIERCODE    | A   | U | VT=CONTACTS*CA         |        | L8  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| O | S | ROUTE          | A   |   |                        |        | T30 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| O | S | FREIGHTPAY     | LC  | U | :ref:`freightpay-list` | PP     | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| O | S | TRANSPORTMETHOD| LC  | U | :ref:`transport-list`  | M      | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| O | S | LOADINGOPTION  | LC  | U | :ref:`loading-list`    | 01     | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| VEHICLECODE    | LC  | U | :ref:`vehicle-list`    |        | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| VEHICLE        | A   | U |                        |        | T20 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Qualitative Values                   |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| DATECODE       | LC  | U | :ref:`date-list`       |        | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| DATETIME       | DT  | U |                        |        | R20 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| TEMPERATURECODE| LC  | U | :ref:`temperature-list`|        | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| TEMPERATURE    | N   |   |                        |        | R6  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| QUANTITYCODE   | LC  | U | :ref:`quantity-list`   |        | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| QUANTITY       | N.4 |   |                        |        | R12 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Notes and Messages                   |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| NOTECODE       | LC  | U | :ref:`note-list`       |        | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| NOTE           | A   |   |                        |        | T40 |
+---+---+----------------+-----+---+------------------------+--------+-----+
| P | AM| NOTEAPPLY      | LC  | U | :ref:`document-list`   |        | L4  |
+---+---+----------------+-----+---+------------------------+--------+-----+

.. include:: ../resources/legend.rst

