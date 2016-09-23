.. _bill-audits:

#############################
Charges Audit Reports
#############################

Applying rates to activities results in charges, which are recorded on charges 
records for later consolidation into invoices. Charges have a standard format 
which simplifies auditing an invoice. The reportable information of a charge is 
either informational description, or presents the charge calculation details.

Detailed Charge Reporting
=============================

WARES maintains charge information at a detailed level so that charges and 
invoice amounts are accurate and trustworthy. This detail means that for 
inventory amounts, charge calculation is based on units, if units are tracked, 
or lots when tracked, or products when lot numbers are not used. Other charges 
may be tracked by the individual transactions of an activity, such as one or 
more document charges for each shipment.

Descriptive Charge Entries
-----------------------------

Descriptive information on a charge audit report consists of:

*  the activity **Date**, 
*  the **Activity** transaction number, 
*  any **Item** information such as product codes,lot numbers or unit numbers, 
   and 
*  the **Description** of the charge. 

These entries are illustrated in the following left-side CHARGES DETAIL report 
sample which shows charges from a warehouse receipt.

.. image:: _images/audit-detail-1.png

Charge Calculation Details
-----------------------------

Each charge results from the following entries:

#. The **Rate Group** and **Service Code** entries used, part of the contract 
   :ref:`bill-rate-quote` for the customer,
#. A billing unit of measure (**UOM**) describing the charge's amount basis, 
#. The calculation of the charge quantity, consisting of **Amount**, 
   **Deficit**, and **Factor**, 
#. The published **Rate** from the customer's rate quote, and 
#. The calculated **Charge**. 

The right-side CHARGES DETAIL report sample, showing these receiving charges, 
is presented here.

.. image:: _images/audit-detail-2.png

Summary Charges Reporting
=============================

Auditing an invoice amount requires examinimg the supporting detail. Detailed 
audit reports can be quite large, and so a CHARGES SUMMARY report presentation 
will reduce the volume of information. 

The CHARGES SUMMARY presents the **Quantity** which is calculated from Amount, 
Deficit, and Factor by the formula::

   Quantity = ( Amount + Deficit ) / Factor

Then individual rate codes are summed by **Activity** to eliminate itemization. 
An example SUMMARY CHARGES report follows.

.. image:: _images/audit-summary.png

Where fractional charges are summarized, the addition of charges rounded to the 
nearest cent may result in (slight) inconsistencies if Quantity*Rate is extended
to recalculate the total charge on a line. This might happen for the 
hundredweight-based storage charge, for example.

Detailed Charges by Code
=============================

The invoice is organized by Rate Group and Service Code, while the previous 
reports are arranged by activity transaction. This makes auditing onerous, so 
an alternative CHARGES BY CODE report is available. 

.. image:: _images/audit-code.png

This report has the same depth as the CHARGES DETAIL, while displaying the 
columns of the CHARGES SUMMARY. Each TOTAL on the report matches one line item 
on the invoice.
