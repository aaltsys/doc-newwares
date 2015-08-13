.. _document-list:

#############################
Document Type codes
#############################

+------+-----------------------------------------------+-----+
| CODE | Document Title                                | EDI |
+======+===============================================+=====+
| -- --| General business documents                          |
+------+-----------------------------------------------+-----+
| BL   | Motor Carrier Bill of Lading                  | 211 |
+------+-----------------------------------------------+-----+
| PO   | Purchase Order                                | 850 |
+------+-----------------------------------------------+-----+
| PR   | Purchase Order Acknowledgment (Sales Order)   | 855 |
+------+-----------------------------------------------+-----+
| IB   | Inventory Inquiry/Advice                      | 846 |
+------+-----------------------------------------------+-----+
| SH   || Shipment Notice/Manifest (ASN)               | 856 |
|      || (Substitutes for 943 inbound or 945 outbound)|     |
+------+-----------------------------------------------+-----+
| -- --| Bailment Warehouse documents                        |
+------+-----------------------------------------------+-----+
| AR   | Warehouse Stock Transfer Shipment Advice      | 943 |
+------+-----------------------------------------------+-----+
| RE   | Warehouse Stock Receipt Advice                | 944 |
+------+-----------------------------------------------+-----+
| AW   | Warehouse Inventory Adjustment Advice         | 947 |
+------+-----------------------------------------------+-----+
| OW   | Warehouse Shipping Order                      | 940 |
+------+-----------------------------------------------+-----+
| SW   | Warehouse Shipping Advice                     | 945 |
+------+-----------------------------------------------+-----+
| -- --| Other warehousing documents                         |
+------+-----------------------------------------------+-----+
| PP   | Pick Ticket / Packing Slip                    |     |
+------+-----------------------------------------------+-----+

Source: ASC-X12 Data Element 479 - Functional Identifier Code.

.. note::
   There is no code "PP" in the EDI standards, as Pick Tickets and Packing slips 
   are paper forms, and not EDI documents.
