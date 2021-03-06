.. _bill-services:

*****************************
Service Codes
*****************************

Introduction to Billing
=============================

WARES billing is based on industry standards for logistics and warehousing 
services. The concepts of hiring the storage and delivery of goods goes back to 
Roman times and law. Today the Uniform Commercial Code (U.C.C. Section 7 [1]_ ) 
establishes the legal basis for logistics operations, and associated standard 
contract terms are promulgated by industry groups such as the International 
Warehouse Logistics Association (IWLA) [2]_ and the International Association 
of Refrigerated Warehouses (IARW). [3]_

Certain warehouse services, particularly storage and handling, are described in 
the legal code, and corresponding methods of applying and calculating charges 
for these services are stated in standard contract terms. WARES conforms to all 
standard billing practices with enhancements to improve billing efficiency. 

Warehouses offer a range of other accessorial services and charges, and WARES 
handles all such charges through a uniform rating and billing structure. WARES 
billing information is comprised of four tiers: Service Codes, 
:ref:`bill-rates`, :ref:`bill-charges`, and :ref:`bill-invoices`. 

Service Codes Entry
=============================

Service Codes, the basis for warehouse billing,  are entered on the WARES 
Company tab. Each code defines one service offered by the warehouse. All 
services, whether offered to a single customer or to every customer, must be 
defined on the Service Codes entry page.

An example service code record is displayed following:

.. image:: _images/services.png

Entries for a Service Code address three aspects of billing information:

*  The service code **Description** provides the default text for corresponding 
   rate descriptions which appear on customer invoices.
*  Service code **usage** is controlled by the **Apply** entry, which defines 
   how rates may use the service code, and the **Activity** entry, which limits  
   the scope of a service to a particular set of warehouse activities.
*  Services are linked to **Accounting** through **Category** and **Ledger** 
   Number entries which define how financial information is presented within 
   WARES and how services are linked to ledger accounts in external accounting 
   software.

.. include:: ../setup/services-example.rst

Service Codes Columns
=============================

Here is a link to the :ref:`services-schema` schema. 

---

.. rubric:: Footnotes

.. [1] https://www.law.cornell.edu/ucc/7
.. [2] :ref:`terms-iwla`
.. [3] :ref:`terms-iarw`
