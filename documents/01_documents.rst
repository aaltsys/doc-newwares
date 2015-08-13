.. _documents:

#############################
Inventory Documents
#############################

Standard warehousing business documents record, maintain, and communicate 
inventory data in WARES. These documents also form the basis of data exchange 
with business trading partners, either through EDI, via direct exchange of JSON 
data, or using custom data import routines. EDI titles and document codes are
listed in :ref:`codes:document-list`.

WARES stores all documents in a single database table. This means that all 
documents share a common data definition, although documents present information 
in views according to their purpose. Each document has a header section, and
repeating transaction line detail. 

Header Section
=============================

WARES document head sections contain a variety of information as shown at 
:ref:`dochead`.

A generic view of document heading entries follows.

.. image:: _images/documents.png

