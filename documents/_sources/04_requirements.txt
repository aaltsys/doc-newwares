.. _require:

#############################
Entry Requirement Checks
#############################

Warehouse inventory documents in WARES follow a consistent structure for header 
information and transaction line detail. The requirements presented here cover
Inbound (receiving) and Outbound (shipping) documents; adjustments to inventory 
need somewhat less information since shipping is not involved.

Document Heading Requirements
=============================

While WARES can record a variety of information, actual entry requirements in
the document header are limited as shown in the following table.

+----------------+----------+----------+----------+----------+----------+----------+
| Column Name    | Expected |  Inbound | Received | Reserved | Allocated|  Shipped |
+================+==========+==========+==========+==========+==========+==========+
| TYPE       [1]_|        3 |        3 |        3 |        4 |        4 |        4 |
+----------------+----------+----------+----------+----------+----------+----------+
| IDENTIFIER [1]_| sequence | sequence | sequence | sequence | sequence | sequence |
+----------------+----------+----------+----------+----------+----------+----------+
| REVISION   [2]_|      000 |      000 |      000 |      000 |      000 |      000 |
+----------------+----------+----------+----------+----------+----------+----------+
| STATUS         |        1 |        2 |       3+ |        1 |        2 |       3+ |
+----------------+----------+----------+----------+----------+----------+----------+
| DATETIME       |     [3]_ |     [3]_ |     [3]_ |     [3]_ |     [3]_ |     [3]_ |
+----------------+----------+----------+----------+----------+----------+----------+
| ACCOUNT        | required | required | required | required | required | required |
+----------------+----------+----------+----------+----------+----------+----------+
| BUILDING       |          |          | required |          | required | required |
+----------------+----------+----------+----------+----------+----------+----------+
| REFERENCECODE  |     [4]_ |     [4]_ |     [4]_ |     [4]_ |     [4]_ |     [4]_ |
+----------------+----------+----------+----------+----------+----------+----------+
| REFERENCE      |     [4]_ |     [4]_ |     [4]_ |     [4]_ |     [4]_ |     [4]_ |
+----------------+----------+----------+----------+----------+----------+----------+
| ADDRESSCODE    |       SF |       SF |       SF | ST  [5]_ | ST  [5]_ | ST  [5]_ |
+----------------+----------+----------+----------+----------+----------+----------+
| ADDRESS        | required | required | required | required | required | required |
+----------------+----------+----------+----------+----------+----------+----------+
| CARRIERCODE    | optional | optional | optional | optional | optional | required |
+----------------+----------+----------+----------+----------+----------+----------+
| FREIGHTPAY     |          |          |          | reqd [5]_| reqd [5]_| reqd [5]_|
+----------------+----------+----------+----------+----------+----------+----------+
+----------------+----------+----------+----------+----------+----------+----------+
| other entries  | optional | optional | optional | optional | optional | optional |
+----------------+----------+----------+----------+----------+----------+----------+

.. [1] The entry page for a document determines the document TYPE, and new 
       document sequence numbers are programmatically assigned.
.. [2] REVISION version is incremented each time a transaction is changed. The 
       current version of a document is always displayed as revision "000". The 
       current version is posted; previous versions will have status '0'.
.. [3] DATETIME, a required value, represents the anticipated completion date
       for Expected, Inbound, Reserved, Allocated. DATETIME records the actual 
       date and time when the status changes to Received or Shipped.
.. [4] Account settings determine REFERENCECODE defaults. Where REFERENCECODE 
       entries exist, the corresponding REFERENCE entries are required.
.. [5] FREIGHTPAY results depend on the first letter of the code.

       *  **P_** prepaid. A 'PF' ADDRESSCODE for the account's billing address
          or freight payment address will be applied.
       *  **C_** collect. The consignee (ship-to) ADDRESSCODE will be used for 
          freight payment as well.
       *  **T_** 3rd party. A corresponding ADDRESSCODE of 'PF' and an aditional 
          associated ADDRESS identifier entry is required. 

Document Line Requirements
=============================

Transactions are entered by line. The following rules apply to transactions:

*  Each line references a single product/variety, lot control, unit identifier, 
   and locator value.
*  Quantities are signed (+/-) to indicating the effect of the transaction on 
   inventory.
*  Lines contain either Reserved or On-Hand quantites, but not both. 
*  The document status and the data content of a line determine whether the 
   entry quantity will be Reserved or On-Hand.
*  A condition code is required for each entry line. The default is G(ood),
   see :ref:`condition-list`.

+-----------------+----------+----------+----------+----------+----------+----------+
| Column Name     | Expected |  Inbound | Received | Reserved | Allocated|  Shipped |
+=================+==========+==========+==========+==========+==========+==========+
| SEQUENCEKEY [7]_| sequence | sequence | sequence | sequence | sequence | sequence |
+-----------------+----------+----------+----------+----------+----------+----------+
| UNITIDENTIFIER  |          |     [8]_ |     [8]_ |          |     [8]_ |     [8]_ |
+-----------------+----------+----------+----------+----------+----------+----------+
| TRANSACTIONTYPE |   3 or 5 |   3 or 5 |   3 or 5 |   4 or 5 |   4 or 5 |   4 or 5 |
+-----------------+----------+----------+----------+----------+----------+----------+
| TRANSACTION [6]_| (header) | (header) | (header) | (header) | (header) | (header) |
+-----------------+----------+----------+----------+----------+----------+----------+
| LINEKEY     [7]_| sequence | sequence | sequence | sequence | sequence | sequence |
+-----------------+----------+----------+----------+----------+----------+----------+
| STATUS          |        1 |        2 |       3+ |        1 |        2 |       3+ |
+-----------------+----------+----------+----------+----------+----------+----------+
| POSTDATE        |      now |      now |      now |      now |      now |      now |
+-----------------+----------+----------+----------+----------+----------+----------+
| LOCATION        |          |          | directed |          |   (unit) |   (unit) |
+-----------------+----------+----------+----------+----------+----------+----------+
| CONDITION       |          |          | required | required |   (unit) |   (unit) |
+-----------------+----------+----------+----------+----------+----------+----------+
| ACCOUNT         | (header) | (header) | (header) | (header) | (header) | (header) |
+-----------------+----------+----------+----------+----------+----------+----------+
| PRODUCT         | required | required | required | required | required | required |
+-----------------+----------+----------+----------+----------+----------+----------+
| VARIETY         | required | required | required | required | required | required |
+-----------------+----------+----------+----------+----------+----------+----------+
| CONTROLCODE     |          | required | required |          |   (unit) |   (unit) |
+-----------------+----------+----------+----------+----------+----------+----------+
| CONTROL         |          | required | required |          |   (unit) |   (unit) |
+-----------------+----------+----------+----------+----------+----------+----------+
| DESCRIPTION     | [product]| [product]| [product]| [product]| [product]| [product]|
+-----------------+----------+----------+----------+----------+----------+----------+
| UNITUOM         | (product)| (product)| (product)| (product)| (product)| (product)|
+-----------------+----------+----------+----------+----------+----------+----------+
| UNITNET         | [product]| [product]| [product]| [product]|   (unit) |   (unit) |
+-----------------+----------+----------+----------+----------+----------+----------+
| UNITTARE        | [product]| [product]| [product]| [product]|   (unit) |   (unit) |
+-----------------+----------+----------+----------+----------+----------+----------+
| UNITSIZE        | [product]| [product]| [product]| [product]|   (unit) |   (unit) |
+-----------------+----------+----------+----------+----------+----------+----------+
| UNITSTACK       | [product]| [product]| [product]| [product]|   (unit) |   (unit) |
+-----------------+----------+----------+----------+----------+----------+----------+
| CONTENTUOM      | (product)| (product)| (product)| (product)| (product)| (product)|
+-----------------+----------+----------+----------+----------+----------+----------+
| CONTENTONHAND   |          |          | required |          |          | required |
+-----------------+----------+----------+----------+----------+----------+----------+
| CONTENTRESERVE  | required | required |          | required | required |          |
+-----------------+----------+----------+----------+----------+----------+----------+
| CONTENTNET      | [product]| [product]| [product]| [product]| [product]| [product]|
+-----------------+----------+----------+----------+----------+----------+----------+
| CONTENTTARE     | [product]| [product]| [product]| [product]| [product]| [product]|
+-----------------+----------+----------+----------+----------+----------+----------+
| CONTENTSIZE     | [product]| [product]| [product]| [product]| [product]| [product]|
+-----------------+----------+----------+----------+----------+----------+----------+
| INNERUOM        | (product)| (product)| (product)| (product)| (product)| (product)|
+-----------------+----------+----------+----------+----------+----------+----------+
| INNERONHAND     |     [9]_ |     [9]_ |     [9]_ |     [9]_ |     [9]_ |     [9]_ |
+-----------------+----------+----------+----------+----------+----------+----------+
| INNERRESERVE    |     [9]_ |     [9]_ |     [9]_ |     [9]_ |     [9]_ |     [9]_ |
+-----------------+----------+----------+----------+----------+----------+----------+
| INNERWEIGHT     |     [9]_ |     [9]_ |     [9]_ |     [9]_ |     [9]_ |     [9]_ |
+-----------------+----------+----------+----------+----------+----------+----------+
| INNERSIZE       |     [9]_ |     [9]_ |     [9]_ |     [9]_ |     [9]_ |     [9]_ |
+-----------------+----------+----------+----------+----------+----------+----------+

.. [6] TRANSACTIONTYPE and TRANSACTION numbers are copied from the document
       header.
.. [7] A LINEKEY is assigned to track posting to a product/variety/control lot 
       combination on reserved quantities. Where unit identifiers are required, 
       and the quantity is on-hand, then LINEKEY is programmatically expanded 
       to unique SEQUENCEKEY entries for each unit transaction line. 
.. [8] UNITIDENTIFIER entries are not required to be unique. Unit numbers repeat
       where skids which are sequentially numbered 1, 2, ... in a production 
       batch, or where materials are loaded on prenumbered reusable skids in a 
       closed manufacturing environment. 
       Where goods are fungible, UNITIDENTIFIER entries are not even required.
.. [9] If a product INNERUOM is null, associated INNER entries are prohibited. 
       Otherwise, INNERWEIGHT and INNERSIZE default to product values.

.. note::
   #. (header), (product), and (unit) **parentheses** indicate unchanged values 
      copied from the respective source.
   #. [product] **brackets** indicate the source of a default value.

.. warning::
   Inbound units can be reserved by outbound shipments. Upon receipt a reserved
   unit might be unavailable due to condition. A method for resolving this 
   quandry is required.
