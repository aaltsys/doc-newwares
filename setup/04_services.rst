.. _services:

#############################
Initial Service Code List
#############################

The WARES billing system is flexible so that any service may be associated with 
an activity, calculated for charges, and billed on an invoice. Configuring 
billing begins with setting up service codes, and WARES provides an initial set 
of these service codes. The standard WARES services list should be a good 
starting point for many warehouses, but companies will have service requests or 
operational issues which require additional services codes. 

This article provides basic information about service codes, and the billing 
documentation provides details on using :ref:`bill-services`. Please follow the 
referenced link to view this information. 

Example Service Codes List
=============================

Following is an example service code list. 

+--------+---------------------------+-------+------------+----------+---------+
| Code   | Description               | Apply | Activity   | Category | Ledger  |
+========+===========================+=======+============+==========+=========+
| 1H     | Receiving Handling        | C     | RECEIPTS   | H        | 5100    |
+--------+---------------------------+-------+------------+----------+---------+
| 1O     | Shipping Handling         | C     | SHIPMENTS  | H        | 5100    |
+--------+---------------------------+-------+------------+----------+---------+
| 1R     | Receiving Storage         | C     | RECEIPTS   | S        | 5200    |
+--------+---------------------------+-------+------------+----------+---------+
| 1S     | Recurring Storage         | C     | AUDITS     | S        | 5200    |
+--------+---------------------------+-------+------------+----------+---------+
| A1     | Lease Space               | R     | CHARGES    | A        | 5300    |
+--------+---------------------------+-------+------------+----------+---------+
| A2     | Refurbishing Space        | R     | CHARGES    | A        | 5300    |
+--------+---------------------------+-------+------------+----------+---------+
| F1     | Freight, Local Cartage    | O     |            | F        | 5410    |
+--------+---------------------------+-------+------------+----------+---------+
| F2     | Freight, Local Drayage    | O     |            | F        | 5410    |
+--------+---------------------------+-------+------------+----------+---------+
| F3     | Freight, Package          | O     |            | F        | 5420    |
+--------+---------------------------+-------+------------+----------+---------+
| F4     | Freight, LTL              | O     |            | F        | 5430    |
+--------+---------------------------+-------+------------+----------+---------+
| F5     | Freight, TL               | O     |            | F        | 5430    |
+--------+---------------------------+-------+------------+----------+---------+
| L1     | Labor, Manhour            | O     |            | L        | 5510    |
+--------+---------------------------+-------+------------+----------+---------+
| L2     | Labor, Man + Lift         | O     |            | L        | 5510    |
+--------+---------------------------+-------+------------+----------+---------+
| L3     | Labor, Supervisor         | O     |            | L        | 5510    |
+--------+---------------------------+-------+------------+----------+---------+
| L4     | Labor, Clerical           | O     |            | L        | 5520    |
+--------+---------------------------+-------+------------+----------+---------+
| L5     | Labor OT, Manhour         | O     |            | L        | 5510    |
+--------+---------------------------+-------+------------+----------+---------+
| L2     | Labor OT, Man + Lift      | O     |            | L        | 5510    |
+--------+---------------------------+-------+------------+----------+---------+
| L3     | Labor OT, Supervisor      | O     |            | L        | 5510    |
+--------+---------------------------+-------+------------+----------+---------+
| L4     | Labor OT, Clerical        | O     |            | L        | 5520    |
+--------+---------------------------+-------+------------+----------+---------+
| MA1    | Inspect and Measure       | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MA2    | Count and Weigh           | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MA3    | Mark and Stencil          | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MA4    | Record Marks and Labels   | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MA5    | Photograph                | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MB1    | Lump, Segregate, Stack    | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MB2    | Assemble and Pack         | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MB3    | Dunnage and Crating       | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MB4    | Banding                   | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MB5    | Stretch Wrap              | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MB6    | Parcel Preparation        | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MB7    | Spot Trailer              | O     |            | M        | 5610    |
+--------+---------------------------+-------+------------+----------+---------+
| MC1    | Copies                    | O     |            | M        | 5620    |
+--------+---------------------------+-------+------------+----------+---------+
| MC2    | FAX Long Distance         | O     |            | M        | 5620    |
+--------+---------------------------+-------+------------+----------+---------+
| MC3    | Postage and Mailing       | O     |            | M        | 5620    |
+--------+---------------------------+-------+------------+----------+---------+
| MC4    | Documentation             | O     |            | M        | 5620    |
+--------+---------------------------+-------+------------+----------+---------+
| MC5    | Generate Reports          | O     |            | M        | 5620    |
+--------+---------------------------+-------+------------+----------+---------+
| MC6    | Expedite                  | O     |            | M        | 5620    |
+--------+---------------------------+-------+------------+----------+---------+
| MD1    | Warehouse Receipt         | M     | RECEIPTS   | M        | 5700    |
+--------+---------------------------+-------+------------+----------+---------+
| MD2    | Bill of Lading            | M     | SHIPMENTS  | M        | 5700    |
+--------+---------------------------+-------+------------+----------+---------+
| MD3    | Picking Ticket            | M     | SHIPMENTS  | M        | 5700    |
+--------+---------------------------+-------+------------+----------+---------+
| MD4    | Packing Slip              | M     | SHIPMENTS  | M        | 5700    |
+--------+---------------------------+-------+------------+----------+---------+
| MD5    | Certificate of Analysis   | M     | SHIPMENTS  | M        | 5700    |
+--------+---------------------------+-------+------------+----------+---------+
| MD6    | Man. Safety Data Sheet    | M     | SHIPMENTS  | M        | 5700    |
+--------+---------------------------+-------+------------+----------+---------+
| X1     | Pallets                   | O     |            | X        | 5800    |
+--------+---------------------------+-------+------------+----------+---------+
| X2     | Services Tax              | O     |            | X        | 5800    |
+--------+---------------------------+-------+------------+----------+---------+
| X3     | COD Collection            | O     |            | X        | 5800    |
+--------+---------------------------+-------+------------+----------+---------+
| X4     | Freight Pay Surcharge     | O     |            | X        | 5800    |
+--------+---------------------------+-------+------------+----------+---------+
| X5     | Materials Reimbursement   | O     |            | X        | 5800    |
+--------+---------------------------+-------+------------+----------+---------+
 
.. note::
   Service codes which are applied **C = Calculated** start with the number 1. 
   Only these four service codes may be used to setup storage and handling 
   rates, as WARES billing calculations are programmed to use only these codes.

Service Code Columns
=============================

*  **Code** -- is a unique service code identifier. The code will be used in 
   defining rates and applying optional charges.
*  **Description** -- is the default text for rates using the code, and it 
   appears on document charges and corresponding invoices.
*  **Apply** -- specifies how a service is used. Values are **C** for Calculated,
   **M** for Mandatory, **O** for Optional, and **R** for Repeating.
*  **Activity** -- limits a service to be used only on listed activity types.
*  **Category** -- provides a convenient shorthand for the revenue type a service 
   represents: **H** for Handling, **S** for Storage, **F** for freight, **L** 
   for Labor, and **M** for Miscellaneous. WARES categorizes revenue to report 
   gross income results.
*  **Ledger Account** -- specifies the actual sales account in the warehouse 
   ledgers where revenue for the service will be posted. Wares includes a 
   utility for exporting invoices into standard accounting software.
