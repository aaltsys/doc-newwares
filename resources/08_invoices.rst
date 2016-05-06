.. _invoices-schema:

#############################
INVOICES Header Data Columns
#############################

Data entries in the invoice head occur once per transaction. Some entries may
contain multiple values. Columns are defined in the table following.

+---+---+----------------+-----+---+------------------------+--------+---+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE              | DEFAULT| JUST| NOTE|
+===+===+================+=====+===+======================+========+=====+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys                                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | INVOICE        | A   | U |                      |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Posting                                  |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | STATUS         | LC  | U | :ref:`status-list`   |        | L2  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | DATETIME       | DT  | U |                      | TODAY  | R20 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | ACCOUNT        | A   | U | VT=ACCOUNTS          |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | DATEPOST       | D   | U |                      |        | R10 | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Reference                                |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | REFERENCE_CODE | LC  | U | :ref:`reference-list`|        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | REFERENCE      | A   |   |                      |        | L20 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | DATE_CODE      | LC  | U | :ref:`date-list`     |        | L4  | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | M | DATE_VAR       | D   | U |                      |        | R10 | [1]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | BATCH          | A   | U |                      |        | L12 | [2]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | TERMS          | LC  | U | :ref:`terms-list`    |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | DUEDATE        | D   | U |                      |        | R10 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Notes and Messages                       |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | AM| NOTECODE       | LC  | U | :ref:`note-list`     |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | AM| NOTE           | A   |   |                      |        | T40 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| P | AM| NOTEAPPLY      | LC  | U | :ref:`document-list` |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+

#############################
INVOICES Lines Data Columns
#############################

+---+---+----------------+-----+---+------------------------+--------+---+-----+
|REQ| SM| COLUMN NAME    | TYPE| UC|VALIDATE              | DEFAULT| JUST| NOTE|
+===+===+================+=====+===+======================+========+=====+=====+
| -- -- -- -- -- -- -- -- -- -- -- -- Keys                                     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | LINEKEY        | A   | U |                      |        | R12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | IDENTIFIER     | SK  | U |                      |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | PAYER          | A   | U | VT=ACCOUNTS          |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Descriptive Entries                      |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | T | GROUP          | A   |   | VT=RATES             |        | L12 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | T | SERVICE        | A   |   | VT=RATES             |        | L8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | BILLUOM        | LC  | U | :ref:`uom-list`      |        | L4  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | T | DESCRIPTION    | A   |   |                      |        | T40 |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | CATEGORY       | LC  | U | :ref:`category-list` |        | L2  | [3]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | LEDGER         | A   |   |                      |        | L12 | [3]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| -- -- -- -- -- -- -- -- -- -- -- -- Rate Calculation                         |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | QUANTITY       | N.2 |   | (MD2)                |        | R8  | [4]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| O | S | RATE           | N.4 |   | (MD4)                |        | R8  | [5]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | EXTENDED       | N.2 |   | (MD2)                |        | R12 | [4]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | SURCHARGE_RATE | N.4 |   | (MD4)                |        | R8  |     |
+---+---+----------------+-----+---+----------------------+--------+-----+-----+
| M | S | SURCHARGE      | N.2 |   | (MD2)                |        | R8  | [6]_|
+---+---+----------------+-----+---+----------------------+--------+-----+-----+

.. include:: ../resources/legend.rst

.. [1] Calculated invoices accumulate charges across a date range, start to end,
       and have a posting date which determines the accounting period.
.. [2] A tracking number for the calculation batch of an invoice allows reversal
       of the calculations by individual invoice or by batch. The batch relates 
       source charges to the invoice.
.. [3] Accounting relationships **Category** and **Ledger** are pulled from the 
       associated service at the time the invoice is created. This information 
       is not part of the associated rate.
.. [4] The invoice **Quantity** is calculated and accumulated from charges as: 

         INVOICE QTY = SUM-CHARGES( ( QUANTITY + DEFICIT ) / FACTOR )

       Similarly the invoice **Extended** is accumulated from charges.
.. [5] Where the rate of a charge has extended decimals, or rates are tiered, 
       or deficits are applied to achieve minimum charges, the nominal charge
       rate will not match the accumulated quantity and extended. There are 
       warehouse customers who have hissies about this, so when rates do not 
       extend then the invoice rate must be blanked.
.. [6] Surcharge rates are applied to the invoice extended amount. The 
       surcharge rate is not displayed on invoice forms.
