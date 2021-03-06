.. _calendars-schema:

#############################
CALENDARS Data Table Columns
#############################

+---+---+----------------+-----+---+----------------------+--------+-----+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE              | DEFAULT| JUST| NOTE|
+===+===+================+=====+===+======================+========+=====+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys                                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | GROUP          | A   | U |                      |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | SERVICE        | A   | U |                      |        | L8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Process Control Entries                  |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | DESCRIPTION    | A   |   |                      |        | T40 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | DATE_PREVIOUS  | D   | U | DATE                 |        | R10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | DATE_LAST      | D   | U | DATE                 | TODAY  | R10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| F | S | DATE-NEXT      | D   | U | DATE                 | calc'd | R10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | DATE-EXPIRE    | D   | U | DATE                 |        | R10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Scheduling Entries                       |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | REPEAT         | LC  | U | :ref:`repeat-list`   |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | OPTIONS        | LC  | U | :ref:`option-list`   |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | VALUES         | LC  | U | :ref:`value-list`    |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+

.. include:: ../resources/legend.rst
