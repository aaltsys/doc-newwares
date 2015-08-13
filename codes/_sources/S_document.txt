.. _type-list:

#############################
Document Type codes
#############################

+------+-----+-----------------------------------------------+
| CODE | EDI | Document Title                                |
+======+=====+===============================================+
| PO   | 850 | Purchase Order                                |
+------+-----+-----------------------------------------------+
| AR   | 943 | Warehouse Stock Transfer Shipment Advice      |
+------+-----+-----------------------------------------------+
| RE   | 944 | Warehouse Stock Receipt Advice                |
+------+-----+-----------------------------------------------+
| AW   | 947 | Warehouse Inventory Adjustment Advice         |
+------+-----+-----------------------------------------------+
| PR   | 855 | Purchase Order Acknowledgment (Sales Order)   |
+------+-----+-----------------------------------------------+
| OW   | 940 | Warehouse Shipping Order                      |
+------+-----+-----------------------------------------------+
| PP   |     | Pick Ticket / Packing Slip                    |
+------+-----+-----------------------------------------------+
| SW   | 945 | Warehouse Shipping Advice                     |
+------+-----+-----------------------------------------------+
| BL   | 211 | Motor Carrier Bill of Lading                  |
+------+-----+-----------------------------------------------+
| IB   | 846 | Inventory Inquiry/Advice                      |
+------+-----+-----------------------------------------------+
| SH   | 856 || Shipment Notice/Manifest (ASN)               |
|      |     || (Substituted for 943 inbound or 945 outbound)|
+------+-----+-----------------------------------------------+

Source: ASC-X12 Data Element 479 - Functional Identifier Code.

.. note::
   There is no code "PP" in the EDI standards, as Pick Tickets and Packing slips 
   are paper forms, not EDI documents.
