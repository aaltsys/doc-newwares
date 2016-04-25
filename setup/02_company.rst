.. _company:

#############################
Warehousing Company
#############################

Each Warehouse Company requires an information record to define the limitation 
of liability statement, to link to company addresses, and to manage message 
statements for warehouse receipts and other invoices.

.. sidebar:: Company Addresses

   .. image:: _images/company-identity.png

Company Identifier and Name
=============================

A unique company identifier must be entered to associate contact address records 
to the warehouse company.

.. _company-liability:

Limitation of Liability
=============================

WARES requires entries for the **Liability Limit** value and **Per** code, 
which combine to produce the **Liability Limit** text.

Section 7-204 of the Uniform Commercial Code sets forth the warehouser's 
standard of care, and allows for a limit on the amount of damages due to 
negligence for which he may be liable. According to the U.C.C., this limitation 
should be expressed per article, per item, or per weight. WARES prints a 
**Liability Limit** statement on warehouse receipts using the declared value 
derived from the customer account, if entered, or defaulting to the warehouse 
company limitation otherwise (see :ref:`account-storage`).

Company Addresses
=============================

WARES uses between one and four contact address records for the warehouse 
company, based on the following specific type codes and the company identifier.

+-------+----------------------------------------------------------------+
| Code  | Description                                                    |
+=======+================================================================+
| C     | The Company general mailing address                            |
+-------+----------------------------------------------------------------+
| SF    | The Company default shipping address                           |
+-------+----------------------------------------------------------------+
| BT    | The Company Bill To address, used for payables                 |
+-------+----------------------------------------------------------------+
| RI    | The Company remittance address, printed on invoices            |
+-------+----------------------------------------------------------------+

The type **C** address record for a warehouse is mandatory. Where another 
specific type of contact record is missing for the company, WARES will use the 
general type **C** address instead. 

.. tip::
   Addresses are maintained through Contacts entries. Refer to :ref:`contacts` 
   for further information.

.. sidebar:: Messages and Notes

   .. image:: _images/company-notes.png

Company Process Control
=============================

.. sidebar:: Process Control

   .. image:: _images/company-process.png

**Process Controls** set features which affect the global operation of WARES.
These entries include:

*  **Entry Status** -- Use this entry to set the default status applied to 
   current records during entry. The available statuses would be **2** 
   (allocated) or **3** (verified received/shipped), as listed in the 
   :ref:`status-list`. In Billing, the Charges Calculation routine uses this
   status to select documents when applying calculated rates.
*  **Period Start** -- This date begins the current open accounting period for 
   the warehouse. Transactions prior to this date are marked archived status.
*  **Next Period** -- This date begins a "future" period for billing 
   calculations. Transactions entered to this date and beyond should not be 
   invoiced until the current period is closed.

Company Invoice Messages
=============================

Calculating billing and producing invoices are primary functions of the WARES 
software. Typically a warehousing company may produce several types of charges: 
accessorial services on receiving and shipping, handling and storage calculated 
on Warehouse Receipts, recurring storage, freight and transportation, and 
miscellaneous services.

WARES accumulates all types of charges to produce a standard summary invoice 
and associated audit reports of varying levels of detail. In addition, WARES 
will print Warehouse Receipts as individual invoices or as documents to attach 
to a master invoice. Warehouse Receipts may be printed prior to accumulation to 
an invoice, or after an invoice for the services has been generated.

Receipts which are issued prior to invoicing should have a printed message to 
tell the recipient that the receipt itself is not an invoice. Invoiced receipts 
should state that the charges are due upon receipt, since this enforces a 
warehouse lein against the goods.

**Document Messages** allow the company to specify the exact wording for each 
type of invoice message. Message types for uninvoiced receipts, invoiced 
receipts, and standard invoices are provided in :ref:`noteapply-list`, along 
with corresponding default message text in :ref:`note-list`.
