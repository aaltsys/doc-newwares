.. _rate-codes:

#############################
Configuring Rate Codes
#############################

The WARES billing system is very flexible, so parctically any service may be 
associated with a document, calculated for charges, and billed on an invoice. 
Setup includes a table of rate codes which may be used in configuring account 
billing. 

The standard WARES code list is not exhaustive, but it should be a good starting 
point for most logistics companies. 

Rate Code Columns
=============================

*  **Code** -- is a unique rate code identifier. The code will be used in 
   defining rates and applying optional charges.
*  **Description** -- is the default text for rates using the code, and it 
   appears on document charges and corresponding invoices.
*  **Apply** -- specifies how a rate is used. Values are **C** for Calculated,
   **M** for Mandatory, **O** for Optional, and **R** for Repeating.
*  **Documents** -- limits a rate to be applied only on listed document types.
*  **Group** -- provides a convenient shorthand for the revenue type a rate code 
   represents: **H** for Handling, **S** for Storage, **F** for freight, **L** 
   for Labor, and **M** for Miscellaneous. WARES groups revenue into these 
   categories to report gross income results.
*  **Ledger Account** -- specifies the actual sales account in the warehouse 
   ledgers where revenue for the rate will be posted. Wares includes a 
   utility for exporting invoices into standard accounting software.

Example Rate Codes List
=============================

Following is an example rate code list. 

+--------+---------------------------+-------+--------------+--------+---------+
| Code   | Description               | Apply | Documents    | Group  | Ledger  |
+========+===========================+=======+==============+========+=========+
| 1H     | Receiving Handling        | C     | RECEIPTS     | H      | 5100    |
+--------+---------------------------+-------+--------------+--------+---------+
| 1O     | Shipping Handling         | C     | SHIPMENTS    | H      | 5100    |
+--------+---------------------------+-------+--------------+--------+---------+
| 1R     | Receiving Storage         | C     | RECEIPTS     | S      | 5200    |
+--------+---------------------------+-------+--------------+--------+---------+
| 1S     | Recurring Storage         | C     | AUDITS       | S      | 5200    |
+--------+---------------------------+-------+--------------+--------+---------+
| A1     | Lease Space               | R     | CHARGES      | A      | 5300    |
+--------+---------------------------+-------+--------------+--------+---------+
| A2     | Refurbishing Space        | R     | CHARGES      | A      | 5300    |
+--------+---------------------------+-------+--------------+--------+---------+
| F1     | Freight, Local Cartage    | O     |              | F      | 5410    |
+--------+---------------------------+-------+--------------+--------+---------+
| F2     | Freight, Local Drayage    | O     |              | F      | 5410    |
+--------+---------------------------+-------+--------------+--------+---------+
| F3     | Freight, Package          | O     |              | F      | 5420    |
+--------+---------------------------+-------+--------------+--------+---------+
| F4     | Freight, LTL              | O     |              | F      | 5430    |
+--------+---------------------------+-------+--------------+--------+---------+
| F5     | Freight, TL               | O     |              | F      | 5430    |
+--------+---------------------------+-------+--------------+--------+---------+
| L1     | Labor, Manhour            | O     |              | L      | 5510    |
+--------+---------------------------+-------+--------------+--------+---------+
| L2     | Labor, Man + Lift         | O     |              | L      | 5510    |
+--------+---------------------------+-------+--------------+--------+---------+
| L3     | Labor, Supervisor         | O     |              | L      | 5510    |
+--------+---------------------------+-------+--------------+--------+---------+
| L4     | Labor, Clerical           | O     |              | L      | 5520    |
+--------+---------------------------+-------+--------------+--------+---------+
| L5     | Labor OT, Manhour         | O     |              | L      | 5510    |
+--------+---------------------------+-------+--------------+--------+---------+
| L2     | Labor OT, Man + Lift      | O     |              | L      | 5510    |
+--------+---------------------------+-------+--------------+--------+---------+
| L3     | Labor OT, Supervisor      | O     |              | L      | 5510    |
+--------+---------------------------+-------+--------------+--------+---------+
| L4     | Labor OT, Clerical        | O     |              | L      | 5520    |
+--------+---------------------------+-------+--------------+--------+---------+
| MA1    | Inspect and Measure       | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MA2    | Count and Weigh           | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MA3    | Mark and Stencil          | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MA4    | Record Marks and Labels   | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MA5    | Photograph                | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MB1    | Lump, Segregate, Stack    | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MB2    | Assemble and Pack         | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MB3    | Dunnage and Crating       | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MB4    | Banding                   | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MB5    | Stretch Wrap              | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MB6    | Parcel Preparation        | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MB7    | Spot Trailer              | O     |              | M      | 5610    |
+--------+---------------------------+-------+--------------+--------+---------+
| MC1    | Copies                    | O     |              | M      | 5620    |
+--------+---------------------------+-------+--------------+--------+---------+
| MC2    | FAX Long Distance         | O     |              | M      | 5620    |
+--------+---------------------------+-------+--------------+--------+---------+
| MC3    | Postage and Mailing       | O     |              | M      | 5620    |
+--------+---------------------------+-------+--------------+--------+---------+
| MC4    | Documentation             | O     |              | M      | 5620    |
+--------+---------------------------+-------+--------------+--------+---------+
| MC5    | Generate Reports          | O     |              | M      | 5620    |
+--------+---------------------------+-------+--------------+--------+---------+
| MC6    | Expedite                  | O     |              | M      | 5620    |
+--------+---------------------------+-------+--------------+--------+---------+
| MD1    | Warehouse Receipt         | M     | RECEIPTS     | M      | 5700    |
+--------+---------------------------+-------+--------------+--------+---------+
| MD2    | Bill of Lading            | M     | SHIPMENTS    | M      | 5700    |
+--------+---------------------------+-------+--------------+--------+---------+
| MD3    | Picking Ticket            | M     | SHIPMENTS    | M      | 5700    |
+--------+---------------------------+-------+--------------+--------+---------+
| MD4    | Packing Slip              | M     | SHIPMENTS    | M      | 5700    |
+--------+---------------------------+-------+--------------+--------+---------+
| MD5    | Certificate of Analysis   | M     | SHIPMENTS    | M      | 5700    |
+--------+---------------------------+-------+--------------+--------+---------+
| MD6    | Man. Safety Data Sheet    | M     | SHIPMENTS    | M      | 5700    |
+--------+---------------------------+-------+--------------+--------+---------+
| X1     | Pallets                   | O     |              | X      | 5800    |
+--------+---------------------------+-------+--------------+--------+---------+
| X2     | Services Tax              | O     |              | X      | 5800    |
+--------+---------------------------+-------+--------------+--------+---------+
| X3     | COD Collection            | O     |              | X      | 5800    |
+--------+---------------------------+-------+--------------+--------+---------+
| X4     | Freight Pay Surcharge     | O     |              | X      | 5800    |
+--------+---------------------------+-------+--------------+--------+---------+
| X5     | Materials Reimbursement   | O     |              | X      | 5800    |
+--------+---------------------------+-------+--------------+--------+---------+
 
.. note::
   The rate codes which are applied **C = Calculated** start with the number 1.
   Only these four rate codes may be used to setup storage and handling rates, 
   as WARES billing calculations are programmed to use only these codes.
