.. _JSON-exchange:

#############################
JSON Exchange Procedures
#############################

JSON exchange will support exchanging order records and their completed 
shipment information between warehouses and customers. Data will be exchanged 
using file repositories on public services, with each exchange site hosted by 
either the warehouse or the customer.

Warehousing logistics is a batch process, where multiple orders are picked and shipped at the same time. As a consequence, the customer usually submits 
approved orders to the warehouse in a batch, and the warehouse replies with 
shipping information as carriers pick up order batches. There are two ways to 
submit orders to the warehouse consistent with this understanding: 
**Single Orders**, and **Batched Orders**.

The warehouse customer must choose whether orders will be submitted singly or 
as a batch when the data exchange is initially configured. Data exchange 
procedures for each method of data transfer are described following.

Orders Customer Setup
=============================

The customer must add sales order software features which provide data exchange 
using JSON formatted files. Besides the JSON formatting, the data files to be 
exchanged would satisfy one or the other of the following transfer methods.

Additionally, either the customer or the warehouse must host a data exchange 
service which provides security and accessibility to both partners, and which 
offers a repository of exchanged documents. Currently we recommend 
:ref:`DropBox <https://www.dropbox.com/>` for this service.

Single Orders
=============================

**Single Orders** are submitted one at a time, where each order is identified 
by a perpetually unique reference number filename of 8 or fewer characters. 
Each order will retain its reference filename when the warehouse processes and 
archives the order. 

At the warehouse customer's end:

#. An order is entered through a web portal, telephone, FAX, or other means.
#. When completed, the order is assigned a sequential **reference** number of
   eight or fewer characters.
#. A JSON export document of the order is created.
#. The JSON text is saved in the exchange **ORDERS** folder under filename 
   **(reference).JSN**. 
#. The sales order is marked as submitted, and cannot be changed afterwards.

At the warehouse:

#. Periodically the warehouse selects all files in the orders exchange inbox.
#. Order files are concatenated into a single input file **ORDERS.JSN** for 
   processing.
#. Original order files are moved to the orders exchange archive folder.
#. The input file is imported to the WARES software to create shipment orders.
#. Orders are processed in a batch for picking and shipping.

Batched Orders
=============================

**Batched Orders** may be submitted in a batch with a generic filename, and 
the warehouse will create a timestamp filename when archiving and processing 
the batch of orders.

At the warehouse customer's end:

#. Orders are submitted through a web portal, telephone, FAX, or other means.
#. Each order is assigned a sales order **reference** number.
#. Periodically orders which are not yet submitted are selected, and a JSON 
   export file is created containing the JSON exports of the orders.
#. The JSON file is saved in the exchange **ORDERS** folder, concatenated with 
   filename **ORDERS.JSN** (or similar agreed name). 
#. The submitted sales orders are marked as submitted, and cannot be changed 
   afterwards.

At the warehouse:

#. Periodically the warehouse retrieves input file **ORDERS.JSN** from the 
   orders exchange inbox.
#. File **ORDERS.JSN** is moved to the order exchange archive folder, renaming 
   the file to **(datetimestamp).JSN** in the process.
#. The input file **ORDERS.JSN** is imported to the WARES software to create 
   shipment orders.
#. Orders are processed in a batch for picking and shipping.

Orders Process Recap
=============================

The previous explanations make it evident that the warehouse processes orders 
in a batch, regardless of whether the customer is submitting orders singly or 
in a batch. 
