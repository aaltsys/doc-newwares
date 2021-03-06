.. _export-details:

#############################
JSON DETAILS Export
#############################

The DOS WARES export utility writes lot details in sequentially numbered JSON 
transaction files. The export definition with JSON names and corresponding 
WARES dictionary columns which provide data conversion between record layouts 
in DOS WARES and webWARES are documented in the following table.

.. note::
   Column F/S/J indicates if a WARES data field (F), a synthetic field (S), or
   a synthetic column specific to the JSON export (J). Column S/M indicates 
   whether a column is single-valued (S) or array multivalue (M). Column A/N 
   refers to whether the data will be quoted string (A) or unquoted numeric (N).

DETAILS
=============================

+-------+------------------+-----+-----+----------------------+---------------+
| F/S/J | JSON NAME        | M/S | A/N | DICTIONARY ("value") | COMMANDS      |
+=======+==================+=====+=====+======================+===============+
|  N/A  | uniqueKey        |                                                  |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | account          | S   | A   | ACCOUNT              |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | product          | S   | A   | PRODUCT              |               |
+-------+------------------+-----+-----+----------------------+---------------+
|  N/A  | variety          | S   | A   | "null"               |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | control          | S   | A   | CONTROL              |               |
+-------+------------------+-----+-----+----------------------+---------------+
+-------+------------------+-----+-----+----------------------+---------------+
|  N/A  | documentType     | S   | A   | "IB"                 |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | document         | S   | A   | @ID                  |               |
+-------+------------------+-----+-----+----------------------+---------------+
|  N/A  | revision         | S   | A   | "00"                 |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | postDate         | S   | A   | DATE                 | (D-JS)        |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | controlCode      | S   | A   | CONTROLCODE ("NA")   |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | description      | T   | A   | DESCRIPTION          |               |
+-------+------------------+-----+-----+----------------------+---------------+
|       | dimensions       |                                                  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitUom          | S   | A   | UOM_STORE ("PL")     |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitNet          | S   | N   | PROD_WT_NET ("null") | (MD2L)        |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitTare         | S   | N   | PROD_WT_TARE ("null")| (MD2L)        |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitSize         | S   | N   | PROD_SIZE ("null")   | (MD42L)       |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitStack        | S   | N   | FACT_STACK ("null")  | (MD0)         |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageUom       | S   | A   | UOM_PIECE ("EA")     |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | packageCount     | S   | N   | FACT_STORE ("null")  | (MD0)         |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | packageNet       | S   | N   | FACT_WEIGHT ("null") | (MD42L)       |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageTare      | S   | N   | FACT_TARE ("null")   | (MD42L)       |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageSize      | S   | N   | FACT_VOLUME ("null") | (MD42L)       |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerUom         | S   | A   | UOM_INNER ("null")   |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerCount       | S   | N   | PROD_PACK ("null")   | (MD0)         |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerWeight      | S   | N   | INNERS_WEIGHT "null" | (MD42L)       |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerSize        | S   | N   | INNERS_SIZE ("null") | (MD42L)       |
+-------+------------------+-----+-----+----------------------+---------------+

.. _export-lines:

TRANSACTION LINES
=============================

+-------+------------------+-----+-----+----------------------+---------------+
| F/S/J | JSON NAME        | M/S | A/N | DICTIONARY ("value") | COMMANDS      |
+=======+==================+=====+=====+======================+===============+
|  N/A  | detail           |                                                  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | sequenceKey      | M   | A   | SERIAL_LIST   (null) | <,,1>         |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitIdentifier   | M   | A   | SERIAL_LIST   (null) | <,,2>         |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | transactionType  | M   | A   | SERIAL_LIST   (null) | <,,3>         |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | transaction      | M   | A   | SERIAL_LIST   (null) | <,,4>         |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | lineKey          | M   | A   | SERIAL_LIST   (null) | <,,5>         |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | status           | M   | A   | SERIAL_LIST   (null) | <,,6>         |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | postDate         | M   | A   | SERIAL_LIST   (null) | <,,7> (D-JS)  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | location         | M   | A   | SERIAL_LIST   (null) | <,,8>         |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | account          | S   | A   | ACCOUNT              |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | product          | S   | A   | PRODUCT              |               |
+-------+------------------+-----+-----+----------------------+---------------+
|  N/A  | variety          | S   | A   | "null"               |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   F   | control          | S   | A   | CONTROL              |               |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | condition        | M   | A   | SERIAL_LIST    ("G") | <,,13>        |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | description      | M   | A   | SERIAL_LIST   (null) | <,,14>        |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitUom          | M   | A   | SERIAL_LIST   (null) | <,,15>        |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitNet          | M   | N   | SERIAL_LIST   (null) | <,,16> (MD2L) |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitTare         | M   | N   | SERIAL_LIST   (null) | <,,17> (MD2L) |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitSize         | M   | N   | SERIAL_LIST   (null) | <,,18> (MD42L)|
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | unitStack        | M   | N   | SERIAL_LIST   (null) | <,,19> (MD0)  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageUom       | M   | A   | SERIAL_LIST   (null) | <,,20>        |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageCount     | M   | N   | SERIAL_LIST   (null) | <,,21> (MD0)  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageOnHand    | M   | N   | SERIAL_LIST   (null) | <,,22> (MD0)  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageReserve   | M   | N   | SERIAL_LIST   (null) | <,,23> (MD0)  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageNet       | M   | N   | SERIAL_LIST   (null) | <,,24> (MD42L)|
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageTare      | M   | N   | SERIAL_LIST   (null) | <,,25> (MD42L)|
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | packageSize      | M   | N   | SERIAL_LIST   (null) | <,,26> (MD42L)|
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | overShort        | M   | N   | SERIAL_LIST   (null) | <,,27> (MD0)  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerUom         | M   | A   | SERIAL_LIST   (null) | <,,28>        |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerCount       | M   | N   | SERIAL_LIST   (null) | <,,29> (MD0)  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerOnHand      | M   | N   | SERIAL_LIST   (null) | <,,30> (MD0)  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerReserve     | M   | N   | SERIAL_LIST   (null) | <,,31> (MD0)  |
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerWeight      | M   | N   | SERIAL_LIST   (null) | <,,32> (MD42L)|
+-------+------------------+-----+-----+----------------------+---------------+
|   J   | innerSize        | M   | N   | SERIAL_LIST   (null) | <,,33> (MD42L)|
+-------+------------------+-----+-----+----------------------+---------------+

.. note::
   Transaction line detail is directly posted from transaction documents in
   receipts, shipments, and adjustments.
