#############################
Document Transaction Lines
#############################

Inventory balances are maintained by product, lot, and unit. When goods are 
expected to be received or are ordered in advance, lot and unit information is 
not available and only product reserved quantities may be updated. When goods 
are inbound and received, or picked and shipped, then unit and lot transaction 
information may be included depending on product tracking requirements.

Lot and  Unit Transactions
=============================

+---+---+----------------+-----+---+----------------------+--------+-----+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE              | DEFAULT| JUST| NOTE|
+===+===+================+=====+===+======================+========+=====+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys                                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | SEQUENCEKEY    | A   | U |                      |        | R12 | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Transaction Entries                      |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | UNITIDENTIFIER | A   | U |                      |        | L20 | [5]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | TRANSACTIONTYPE| A   | U |                      |        | R2  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | TRANSACTION    | A   | U |                      |        | R10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | LINEKEY        | A   | U |                      |        | R10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Posting Control Entries                  |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | STATUS         | A   | U |                      |        | R2  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | POSTDATE       | A   | U | DATE                 | TODAY  | R10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | LOCATION       | A   | U | VT=LOCATIONS         | WH     | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | CONDITION      | LC  | U | :ref:`condition-list`| G      | L2  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Lot Identification Entries               |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | ACCOUNT        | A   | U | VT=ACCOUNTS          |        | L10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | PRODUCT        | A   | U | VT=PRODUCTS key1     |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | VARIETY        | A   | U | VT=PRODUCTS key2     | null   |     |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CONTROLCODE    | LC  | U | :ref:`control-list`  | [3]_   | L2  | [4]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CONTROL        | A   | U |                      | [3]_   | L16 | [4]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | T | DESCRIPTION    | A   |   |                      |        | T40 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Quantitative Entries                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | UNITUOM        | LC  | U | :ref:`uom-list`      | PL     | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITNET        | N.2 |   | (MD2)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITTARE       | N.2 |   | (MD2)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITSIZE       | N.2 |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | UNITSTACK      | N.0 |   | (MD0)                |        | R1  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTUOM     | LC  | U | :ref:`uom-list`      | CA     | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTONHAND  | N.0 |   | (MD0)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTRESERVE | N.0 |   | (MD0)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTNET     | N.4 |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTTARE    | N.4 |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONTENTSIZE    | N.4 |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERUOM       | LC  | U | :ref:`uom-list`      | EA     | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERONHAND    | N.0 |   | (MD0)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERRESERVE   | N.0 |   | (MD0)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERWEIGHT    | N.4 |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | INNERSIZE      | N.4 |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+

.. [1] Transaction line detail is directly posted from transaction documents in
       receipts, shipments, and adjustments.
.. [2] An optional list of conditions may apply to units in a lot, such as 
       damage, inspection hold, quality condition, etc.
.. [3] Control codes may determine default values for lot control, such as 
       rotation date or warehouse lot sequences.
.. [4] CONTROLCODE and CONTROL are optional when tracking is product only (P).
.. [5] UNITIDENTIFIER will be *null* unless tracking is by unit (U).

.. note::
   *  Tracking requirements are set by product and are not reflected in the 
      transaction line data.
   *  Where lots are fungible and multiple units are received on a single line, 
      there is no way to determine the unit count directly from the transaction 
      line because the CONTENTCOUNT factor is maintained on the product or lot
      record.
   *  When products or lots are fungible then storage units must be uniform. 
      This is a necessary concequence of not tracking individual units.
