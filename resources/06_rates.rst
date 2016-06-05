.. _rates-schema:

#############################
RATES Data Table Columns
#############################

+---+---+----------------+-----+---+------------------------+--------+---+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE              | DEFAULT| JUST| NOTE|
+===+===+================+=====+===+======================+========+=====+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys                                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | GROUP          | A   | U |                      |        | L12 | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | SERVICE        | A   | U | VT=SERVICES          |        | L8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Identification                           |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | APPLIED        | LC  | U | :ref:`apply-list`    |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | S | ACCOUNT        | A   | U | VT=ACCOUNTS          |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Reference                                |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | ACTIVITY       | LC  | U | :ref:`activity-list` |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | PER            | LC  | U | :ref:`per-list`      |        | L4  | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | AM| QTY_METHOD     | A   |   |                      |        | L4  | [3]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | AM| PAYER_METHOD   | A   |   |                      |        | L20 | [3]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Rate Calculation                         |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | A | DESCRIPTION    | A   | U |                      |        | T40 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | A | RATE_TYPE      | LC  | U | :ref:`uom-list`      |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | FACTOR         | N   |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | SURCHARGE      | N   |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | ITEM_MIN       | N   |   | (MD2)                |        | R8  | [5]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | NM| RATE           | N   |   | (MD4)                |        | R8  | [4]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | NM| QUANTITY       | N   |   | (MD2)                |        | R8  | [4]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | NM| MINIMUM        | N   |   | (MD2)                |        | R8  | [4]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | AM| BILL_UOM       | LC  | U | :ref:`uom-list`      |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Repeating Calendar                       |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| C | A | CALENDAR_KEY   | A   | U |                      |        | L20 | [6]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+

.. include:: ../resources/legend.rst

.. [1] Group entries are either **GLOBAL**, an account identifier, or a 
       user-assigned value. For **GLOBAL**, the account identifier is blank 
       and protected. Account groups fill and protect the account entry. The
       account on user-assigned groups may be blank or an account identifier.
       All rates in a group must have the same entry for **ACCOUNT**.
.. [2] **PER** lists may be filtered by activity to show differing choices.
.. [3] **QTY_OBJECT** and **PAYER_OBJECT** represent coded methods which would 
       return values for the quantity or the payer. The payer may be different
       from the account.
.. [4] Rates are tiered and include rate rationality using deficit quantities.
.. [5] Where charges are calculated for a multi-line activity, a minimum charge 
       for the total transaction may apply.
.. [6] Calendar values and associated operations are a component of billing 
       rules, where they are described.
