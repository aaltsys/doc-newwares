.. _document-list:

#############################
Document Type Codes
#############################

+------+-----------------------------------------------+-----+------+
| CODE | Document Title                                | EDI | TYPE |
+======+===============================================+=====+======+
| -- --| General business documents                                 |
+------+-----------------------------------------------+-----+------+
| BL   | Motor Carrier Bill of Lading                  | 211 |  n/a |
+------+-----------------------------------------------+-----+------+
| PO   | Purchase Order                                | 850 |  n/a |
+------+-----------------------------------------------+-----+------+
| PR   | Purchase Order Acknowledgment (Sales Order)   | 855 |  n/a |
+------+-----------------------------------------------+-----+------+
| IB   | Inventory Inquiry/Advice                      | 846 |  n/a |
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
| LT   | Rewarehousing Location Transfer               | n/a |  1   |
+------+-----------------------------------------------+-----+------+
| n/a  | Transaction Charges                           | n/a |  6   |
+------+-----------------------------------------------+-----+------+
| n/a  | Credit Memo / Payment Advice                  | n/a |  7   |
+------+-----------------------------------------------+-----+------+
| IN   | Warehouse Invoice                             | 810 |  8   |
+------+-----------------------------------------------+-----+------+
| PP   | Pick Ticket / Packing Slip                    | n/a |  n/a |
+------+-----------------------------------------------+-----+------+

Source: ASC-X12 Data Element 479 - Functional Identifier Code.

.. note::
   There is no code "PP" in the EDI standards, as Pick Tickets and Packing slips 
   are paper forms, and not EDI documents.
