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

Document Heading
=============================

Data entries in the document head occur once per transaction. Some entries may
contain multiple values. 


.. _dochead:

Document Identification
=============================
|

.. sidebar:: Document Identification

   Documents are identified by their unique sequence number, and by associated 
   reference numbers for sales orders, purchase orders, PRO numbers, and other 
   coded document identifiers.

.. image:: _images/document-1ident.png

*  **Sequence Number** 
*  **Posting Status**
*  **Posting Datetime**
*  **Qualifiers** and **Reference Numbers**
*  **Freight Payment** is included in the identifier section due to dependencies
   which follow. 

Document Addresses
=============================
|

.. sidebar:: Document Addresses

   Documents for carriage in private warehouses require three addresses, but for 
   third-party warehousing four addresses are required.

.. image:: _images/document-2address.png

Document Transportation
=============================
|

.. sidebar:: Transportation Entries

.. image:: _images/document-3transport.png

.. image:: _images/document-3transport-b.png


Qualifiers and Quantities
=============================
|

.. sidebar:: Quantitative Values

   Quantitative values may be entered to document ...

.. image:: _images/document-4values.png

Notes and Messages
=============================
|

.. sidebar:: Document Messages

   Notes allow product information which is intended for clerical use, warehouse
   laborers, transportation, or recipient consumption to be recorded and then 
   displayed on appropriate documents or other venues.

.. image:: _images/document-5notes.png

.. note::
   The entirety of **QUANTITATIVE VALUES** and **NOTES AND MESSAGES** are part
   of advanced mode.

+-----------------------+-------------+-------------+-------------+-----+------+
| Entry Name            | Receiving   | Shipping    | Adjusting   | M/S | Note |
+=======================+=============+=============+=============+=====+======+
| Sequence Number       | Mandatory   | Mandatory   | Mandatory   |  S  | [1]_ |
+-----------------------+-------------+-------------+-------------+-----+------+
| Posting Status        | Mandatory   | Mandatory   | Mandatory   |  S  | [2]_ |
+-----------------------+-------------+-------------+-------------+-----+------+
| Posting DateTime      | Mandatory   | Mandatory   | Mandatory   |  S  | [3]_ |
+-----------------------+-------------+-------------+-------------+-----+------+
| Qualifier/ Reference  | Optional    | Optional    | Optional    |  M  | [4]_ |
+-----------------------+--------------+------------+-------------+-----+------+
| Freight Payment       | Not Used    | Mandatory   | Not Used    |  S  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Account               | Mandatory   | Mandatory   | Mandatory   |  S  | [4]_ |
+-----------------------+-------------+-------------+-------------+-----+------+
| Warehouse Building    | Mandatory   | Mandatory   | Mandatory   |  S  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Ship From / To        | Mandatory   | Mandatory   | Not Used    |  S  | [4]_ |
+-----------------------+-------------+-------------+-------------+-----+------+
| Freight Billing       | Not Used    | Conditional | Not Used    |  S  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Carrier SCAC          | Mandatory   | Mandatory   | Not Used    |  S  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Route                 | Not Used    | Optional    | Not Used    |  S  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Contact               | Optional    | Optional    | Not Used    |  S  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Qualifier / Vehicle   | Optional    | Optional    | Not Used    |  M  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Transport Mode        | Optional    | Optional    | Not Used    |  S  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Loading Option        | Optional    | Optional    | Not Used    |  S  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Codes / Datetimes     | Optional    | Optional    | Not Used    |  M  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Codes / Temperatures  | Optional    | Optional    | Not Used    |  M  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Codes / Quantities    | Optional    | Optional    | Not Used    |  M  |      |
+-----------------------+-------------+-------------+-------------+-----+------+
| Code/ Note / Apply    | Optional    | Optional    | Optional    |  M  |      |
+-----------------------+-------------+-------------+-------------+-----+------+

-----

.. [1] Document types are automatically selected according to the page where the 
       document is entered: Receipts, Shipments, Adjustments, ....
.. [2] Sequence Keys and revision sequence counters are applied to documents of
       each type as described in the previous note.
.. [3] Documents are checked for uniqueness of: ACCOUNT, ADDRESS, and REFERENCE.
.. [4] ADDRESSCODE defaults are determined by document type.

