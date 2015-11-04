.. _fac-locator:

#############################
Locator Views
#############################


Locator Purpose
=============================

The **Locator** displays warehouse inventory quantity and status information 
through a series of four views: documents, transaction lines, locator items, 
and product inventory.

*  **Documents** form the basis of warehouse management. The locator
   lists documents and displays document details. Filter options for documents 
   are by account, date or date range, product, and lot.

*  Document **transaction** lines provide the basic information used to build 
   locator balances. The transaction lines view may be filtered by account, 
   product, lot, date or date range, document, and location or location range.

*  :ref:`inv-balances` summarize locator information by product. The balances 
   view is dynamic, created from the locator information. Inventory is filtered 
   by account and product.
   
*  :ref:`inventory` shows warehouse inventory and quantities organized by
   lot and product. The locator view filter includes account, 
   product, lot, location or location range, and on-hand/expected/undelivered.
   
   Fungible bulk goods which are not stored by unit are displayed by location or 
   lot instead. Inventory quantities show on-hand, allocated/committed, reserved 
   with hold codes, and resulting available. Optionally the locator may show
   goods in transit and shipped quantites where delivery has not been confirmed.

Locator Features
=============================

*  Directed putaway and automated pick assignment 
*  Re-warehousing calculation for space and travel optimization 
*  Cycle counting and bulk inventory collection for inventory accuracy.

Locator features take advantage of an Android-based application, available
for free from the Google store for use with Advanced WARES.

Facility Setup
=============================

The physical location for goods in storage is described in the facility setup. 

Setup buildings.

Setup location codes.

View inventory locations.

Locator Transaction Columns
=============================

Excluding location transfers, locator transaction lines are identically the 
inventory document line transactions. The database column layout for these 
transactions is available in documentation resources at :ref:`lotlines-schema`.

