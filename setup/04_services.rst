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
documentation provides additional details on using services. Please see that 
section for more information. 

.. _services-list:

.. include:: services-example.rst

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
