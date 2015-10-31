#############################
Document Transaction Lines
#############################

Inventory balances are maintained by product, lot, and unit. When goods are 
expected to be received or are ordered in advance, lot and unit information is 
not available and only product reserved quantities may be updated. When goods 
are inbound and received, or picked and shipped, then unit and lot transaction 
information may be included depending on product tracking requirements.

.. _trlines:

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
| M | S | UNITIDENTIFIER | A   | U |                      |        | L20 | [2]_|
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
| -- -- -- -- -- -- -- -- -- -- -- -- Lot Identification Entries               |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | ACCOUNT        | A   | U | VT=ACCOUNTS          |        | L10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | PRODUCT        | A   | U | VT=PRODUCTS key1     |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | VARIETY        | A   | U | VT=PRODUCTS key2     | null   |     |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | CONTROL        | A   | U |                      | [3]_   | L16 | [4]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CONDITION      | LC  | U | :ref:`condition-list`| G      | L2  | [5]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Other Entries                            |
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
| M | S | CONTENTUOM     | LC  | U | :ref:`uom-list`      | CA     | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CONTENTCOUNT   | N.0 |   | (MD0)                |        | R8  |     |
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
| O | S | OVERSHORT      | N.0 |   | (MD0)                |        | R8  | [6]_|
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

.. [1] Transaction lines are directly written from transaction documents in
       receipts, shipments, and adjustments.
.. [2] UNITIDENTIFIER is required when tracking is by (U)nit; it is optional 
       when tracking by (C)ontrol.
.. [3] A CONTROLCODE (on the product master) may determine default values for 
       lot control, such as a rotation date or a warehouse lot sequence. 
.. [4] CONTROL may be entered optionally when tracking is by (P)roduct.
.. [5] Inventory control allows a single primary condition code which is used 
       with balance identifiers, where only lot balances which are (G)ood are 
       considered available. Additional conditions which may apply to units in 
       a lot: quality check, inspection hold, freezer hold, and so forth, are 
       considered descriptive and are ignored for posting purposes.
.. [6] OVERSHORT quantity applies to content of receipts only.

.. note::
   *  Tracking requirements are set by product and are not reflected in the 
      transaction line data.
   *  When multiple fungible units are received on a line, the number of units
      is determined from the CONTENTCOUNT and the quantity. Where units are not 
      uniform, separate lot control values or unit identifiers should be 
      assigned to manage the inventory.
   *  When products or lots are fungible then storage units must be uniform. 
      This is a necessary consequence of not tracking individual units.

.. include:: ../resources/legend.rst
