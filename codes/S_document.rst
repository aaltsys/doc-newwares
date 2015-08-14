.. _document-list:

#############################
Document Type Codes
#############################

+------+-----------------------------------------------+-----+------+
| CODE | Document Title                                | EDI | TYPE |
+======+===============================================+=====+======+
| -- --| General business documents                                 |
+------+-----------------------------------------------+-----+------+
| BL   | Motor Carrier Bill of Lading                  | 211 |  N/A |
+------+-----------------------------------------------+-----+------+
| PO   | Purchase Order                                | 850 |  N/A |
+------+-----------------------------------------------+-----+------+
| PR   | Purchase Order Acknowledgment (Sales Order)   | 855 |  N/A |
+------+-----------------------------------------------+-----+------+
| IB   | Inventory Inquiry/Advice                      | 846 |  N/A |
+------+-----------------------------------------------+-----+------+
| SH   || Shipment Notice/Manifest (ASN)               | 856 || 3   |
|      || (Substitutes for 943 inbound or 945 outbound)|     || 4   |
+------+-----------------------------------------------+-----+------+
| -- --| Bailment Warehouse documents                               |
+------+-----------------------------------------------+-----+------+
| AR   | Warehouse Stock Transfer Shipment Advice      | 943 |  3   |
+------+-----------------------------------------------+-----+------+
| RE   | Warehouse Stock Receipt Advice                | 944 |  3   |
+------+-----------------------------------------------+-----+------+
| AW   | Warehouse Inventory Adjustment Advice         | 947 |  5   |
+------+-----------------------------------------------+-----+------+
| OW   | Warehouse Shipping Order                      | 940 |  2   |
+------+-----------------------------------------------+-----+------+
| SW   | Warehouse Shipping Advice                     | 945 |  4   |
+------+-----------------------------------------------+-----+------+
| -- --| Other warehousing documents                                |
+------+-----------------------------------------------+-----+------+
| LT   | Rewarehousing Location Transfer               |     |  1   |
+------+-----------------------------------------------+-----+------+
|      | Transaction Charges                           |     |  6   |
+------+-----------------------------------------------+-----+------+
|      | Credit Memo / Payment Advice                  |     |  7   |
+------+-----------------------------------------------+-----+------+
| IN   | Warehouse Invoice                             | 810 |  8   |
+------+-----------------------------------------------+-----+------+
| PP   | Pick Ticket / Packing Slip                    |     |  N/A |
+------+-----------------------------------------------+-----+------+

Source: ASC-X12 Data Element 479 - Functional Identifier Code.

.. note::
   There is no code "PP" in the EDI standards, as Pick Tickets and Packing slips 
   are paper forms, and not EDI documents.
