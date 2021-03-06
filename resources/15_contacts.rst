.. _contacts-schema:

#############################
CONTACTS Data Table Columns
#############################

+---+---+----------------+-----+---+----------------------+--------+-----+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE              | DEFAULT| JUST| NOTE|
+===+===+================+=====+===+======================+========+=====+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys & Associations                      |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CONTACTTYPE    | A   | U | :ref:`contacts-list` |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CONTACT        | A   | U |                      |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | ACCOUNT        | A   | U | VT=ACCOUNTS          |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Name and Address                         |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | NAME           | A   |   |                      |        | L30 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | STREET         | A   |   |                      |        | L30 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | CITY           | A   |   |                      |        | L17 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | STATE          | A   | U | :ref:`state-list`    |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | POSTALCODE     | A   | U |                      |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | COUNTRY        | A   | U | :ref:`country-list`  |        |     |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Contact Information                      |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | CONTACT        | A   |   |                      |        | L20 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | SALUTATION     | A   |   |                      |        | L20 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | POSITION       | A   |   |                      |        | L15 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | EMAIL          | A   |   |                      |        | L30 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | PHONE          | A   |   |                      |        | L30 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Shipping Information                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | FREIGHTPAY     | A   | U | :ref:`freightpay-list`        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | FOB            | A   | U | :ref:`fob-list`      |        | L2  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | COD            | A   | U | :ref:`cod-list`      |        | L2  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | LINK           | A   | U |                      |        | L10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | USERDATA       | A   | U |                      |        | T20 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+

.. include:: ../resources/legend.rst
