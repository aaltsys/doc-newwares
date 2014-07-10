.. _documents:

#############################
Inventory Documents
#############################

WARES uses six standard warehousing business documents to record, maintain, and 
communicate inventory data. These documents also form the basis of data exchange 
with business trading partners, either through EDI, via direct exchange of JSON 
data, or using custom data import routines. Basic and alternative warehousing 
documents and their EDI transaction numbers are:

+---------------------+-----------------------------------------------+--------+
| Document Name       | Title                                         | EDI ID |
+---------------------+-----------------------------------------------+--------+
| Inbound Receipt     | Warehouse Stock Transfer Advance Notice       |  943   |
+---------------------+-----------------------------------------------+--------+
| Receipt Advice      | Warehouse Stock Transfer Receipt Advice       |  944   |
+---------------------+-----------------------------------------------+--------+
| Outbound Shipment   | Warehouse Shipping Order                      |  940   |
+---------------------+-----------------------------------------------+--------+
| Shipment Advice     | Warehouse Shipment Advice                     |  945   |
+---------------------+-----------------------------------------------+--------+
| Adjustment Advice   | Warehouse Inventory Adjustment Advice         |  947   |
+---------------------+-----------------------------------------------+--------+
| Inventory Report    | Inventory Inquiry/Advice Report               |  846   |
+---------------------+-----------------------------------------------+--------+
| Advance Ship Notice || Shipment Notice/Manifest (ASN)               |  856   |
|                     || (Substituted for 943 inbound or 945 outbound)|        |
+---------------------+-----------------------------------------------+--------+

Data Layout
=============================

WARES stores all documents in a single database table. This means that all 
documents share a common data definition, although documents present information 
in views according to their purpose. Each document has a header section, 
repeating line detail, and a summary footer. The master layout of these sections 
is shown following, along with wireframe views of edit forms.

Header Section
-----------------------------

Data entries in the document header occur once per transaction.


.. image:: _images/documents.png


+------------------+-----+--------+------------------+
| **COLUMN NAME**  |**M**|**TYPE**| **CODE VALUES**  |
+------------------+-----+--------+------------------+
| DOCUMENT TYPE    | M   | CODE   | R/W/O/S/A        |
+------------------+-----+--------+------------------+
| DOCUMENT ID      | M   | SEQ    | SEQ KEY          |
+------------------+-----+--------+------------------+
| STATUS           | M   | CODE   | -1/0/1/2/3/4/5/6 |
+------------------+-----+--------+------------------+
| DATE/TIME        | M   | DT     |                  |
+------------------+-----+--------+------------------+
| ACCOUNT          | M   | F-KEY  | ACCOUNTS         |
+------------------+-----+--------+------------------+
| BUILDING         | M   | F-KEY  | ADDRESSES*B      |
+------------------+-----+--------+------------------+
| REFERENCE_CODE   | A-C | CODE   | REFERENCE LIST   |  
+------------------+-----+--------+------------------+
| REFERENCE        | A-CR| STRING |                  |
+------------------+-----+--------+------------------+
| ADDRESS_CODE     | A-C | CODE   | ADDRESS LIST     |
+------------------+-----+--------+------------------+
| ADDRESS          | A-CR| F-KEY  | ADDRESSES        |
+------------------+-----+--------+------------------+
| CONTACT          | O   | STRING |                  |
+------------------+-----+--------+------------------+
| CARRIER_CODE     | O   | F-KEY  | ADDRESSES*CA     |
+------------------+-----+--------+------------------+
| ROUTE            | O   | TEXT   |                  |
+------------------+-----+--------+------------------+
| FREIGHT_PAY      | C   | CODE   | PP/CC/TP         |
+------------------+-----+--------+------------------+
| TRANSPORT_MODE   | C   | CODE   | TRANSPORT LIST   |             
+------------------+-----+--------+------------------+
| LOADING_OPTION   | C   | CODE   | LOADING LIST     |
+------------------+-----+--------+------------------+
| VEHICLE_CODE     | A-C | CODE   | VEHICLE LIST     |
+------------------+-----+--------+------------------+
| VEHICLE_NUMBER   | A-CR| STRING |                  |
+------------------+-----+--------+------------------+
| DATE_CODE        | A-C | CODE   | DATE LIST        |
+------------------+-----+--------+------------------+
| DATE             | A-CR| DATE   |                  |
+------------------+-----+--------+------------------+
| TIME_CODE        | A-C | CODE   | TIME LIST        |
+------------------+-----+--------+------------------+
| TIME             | A-CR| TIME   |                  |
+------------------+-----+--------+------------------+
| TEMPERATURE_CODE | A-C | CODE   | TEMPERATURE LIST |
+------------------+-----+--------+------------------+
| TEMPERATURE      | A-CR| INT    |                  |
+------------------+-----+--------+------------------+
| QUANTITY_CODE    | A-C | CODE   | QUANTITY LIST    |
+------------------+-----+--------+------------------+
| QUANTITY         | A-CR| FLOAT  |                  |
+------------------+-----+--------+------------------+
| MESSAGE_CODE     | A-C | CODE   | MESSAGE LIST     |
+------------------+-----+--------+------------------+
| MESSAGE          | A-CR| TEXT   |                  |
+------------------+-----+--------+------------------+

Detail Lines
-----------------------------


.. image:: _images/document-lines.png


Transaction lines contain control, identifying, quantitative, and descriptive 
information. The SECT(ion) heading in the following table indicates how each 
data column is categorized within these four information types.

+------+------------------+-----+--------+------------------+
| SECT | **COLUMN NAME**  |**M**|**TYPE**| **CODE VALUES**  |
+------+------------------+-----+--------+------------------+
|   1  | LINE_KEY         | M   | STRING |                  |
+------+------------------+-----+--------+------------------+
|   1  | UNIT_IDENTIFIER  | M   | STRING |                  |
+------+------------------+-----+--------+------------------+
|   1  | DOCUMENT         | M   | ARRAY  |                  |
+------+------------------+-----+--------+------------------+
|   1  | DATE_CODE        | A-C | ARRAY  | DATE LIST        |
+------+------------------+-----+--------+------------------+
|   1  | DATETIME         | A-CR| DATE   |                  |
+------+------------------+-----+--------+------------------+
|   1  | STATUS_CODE      | M   | CODE   | STATUS LIST      |
+------+------------------+-----+--------+------------------+
|   1  | CONDITION_CODE   | A-C | CODE   | CONDITION LIST   |
+------+------------------+-----+--------+------------------+
|   2  | PRODUCT          | M   | F-KEY  | PRODUCTS         |
+------+------------------+-----+--------+------------------+
|   2  | SCAN CODE        | O   | STRING |                  |
+------+------------------+-----+--------+------------------+
|   2  | IDENTIFIER_TYPE  | A-C | CODE   | PRODUCT LIST     |
+------+------------------+-----+--------+------------------+
|   2  | IDENTIFIER       | A-CR| STRING |                  |
+------+------------------+-----+--------+------------------+
|   2  | CONTROL_CODE     | A-C | CODE   | CONTROL LIST     |
+------+------------------+-----+--------+------------------+
|   2  | CONTROL_LOT      | A-CR| STRING |                  |
+------+------------------+-----+--------+------------------+
|   2  | LOCATION         | M   | F-KEY  | LOCATIONS        |
+------+------------------+-----+--------+------------------+
|   3  | UNIT_NET         | O   | FLOAT  |                  |
+------+------------------+-----+--------+------------------+
|   3  | UNIT_TARE        | O   | FLOAT  |                  |
+------+------------------+-----+--------+------------------+
|   3  | CONTENTS         | O   | INT.2  |                  |
+------+------------------+-----+--------+------------------+
|   3  | CONTENTS_NET     | O   | FLOAT  |                  |
+------+------------------+-----+--------+------------------+
|   3  | CONTENTS_TARE    | O   | FLOAT  |                  |
+------+------------------+-----+--------+------------------+
|   3  | INNERS           | O   | INT.4  |                  |
+------+------------------+-----+--------+------------------+
|   3  | INNERS_WEIGHT    | O   | FLOAT  |                  |
+------+------------------+-----+--------+------------------+
|   4  | DESCRIPTION      | O   | TEXT   |                  |
+------+------------------+-----+--------+------------------+

Footer Summary
-----------------------------

Transaction Posting
=============================

Locator posting is determined by: the operation (POST, REVERSE), the quantity 
sign, the document type, the status, and the condition. 

POST:

   INBOUND:
   
   *  Choice of entering from order, or from ASN
   *  Unit lines added to locator on status INBOUND
   *  Units can be RESERVED, cannot be allocated
   *  Order required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = EXPECTED
      |  DATETIME
      |  STATUS_CODE = INBOUND
      |  PRODUCT
      |  WEIGHTS & MEASURES  (multiple entries)
      |  CONTENTS (multiple entries)
   
   *  ASN required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = EXPECTED
      |  DATETIME
      |  STATUS_CODE = INBOUND
      |  PRODUCT
      |  UNIT_IDENTIFIER
      |  CONTROL_CODE
      |  CONTROL_LOT
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
   RECEIPT:
   
   *  Choice of completing an order, an ASN, or entering from scratch
   *  Unit lines updated or added to locator on status AVAILABLE, HELD, DAMAGED
   *  DOCUMENT array updated to have INBOUND and RECEIPT
   *  Receipt required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = RECEIVED
      |  DATETIME
      |  STATUS_CODE = AVAILABLE, HELD, DAMAGED
      |  PRODUCT
      |  UNIT_IDENTIFIER
      |  CONTROL_CODE
      |  CONTROL_LOT
      |  LOCATION
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
   .. note: 
      An INBOUND unit could be reserved, but upon receipt the unit might be 
      HELD or DAMAGED. A rebalance routine might not have enough inventory 
      afterwards to account for the RESERVE.
   
   OUTBOUND:
   
   *  Entered, received as Warehouse Order (940), or JSON import
   *  Lines added to locator as RESERVED, deducting from AVAILABLE
   *  Order required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = RESERVED
      |  DATETIME
      |  STATUS_CODE = RESERVED
      |  PRODUCT
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
   SHIPMENT:
   
   *  Choice of completing an outbound order, or entering from scratch
   *  AVAILABLE (scratch entry) or RESERVED (outbound completion) lines updated 
      to ALLOCATED
   *  DOCUMENT array updated to have OUTBOUND and SHIPMENT
   *  Shipment required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = SHIPPED
      |  DATETIME
      |  STATUS_CODE = SHIPPED
      |  PRODUCT
      |  UNIT_IDENTIFIER
      |  CONTROL_CODE
      |  CONTROL_LOT
      |  LOCATION
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
   ADJUSTMENT: