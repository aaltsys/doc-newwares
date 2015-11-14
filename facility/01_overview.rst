.. _facility:

#############################
Facility Setup Overview
#############################

In WARES, a facility is a warehouse company which operates as a single business 
entity to store and manage goods for a group of customer accounts in one or more 
buildings. **Facility** selections provide forms to enter this setup information 
for a warehouse company. 

Warehousing Company
=============================

Each instance of WARES is used by one warehousing company. The identifier and 
contact information for the warehouse is displayed in this form, along with 
control data for the :ref:`company`. 

Contacts and Addresses
=============================

All address information is collected in a single table of :ref:`contacts`.

Customer Accounts
=============================

Every product in the warehouse belongs to an account. For private warehousing, 
accounts might be departments or divisions in the company ledgers. Public 
warehouses understand that :ref:`accounts` are their customers.

Buildings and Locations
=============================

A warehouse company is responsible for goods under management in physical 
buildings and locations within and around them. Information to describe these 
locations is entered in :ref:`locations`.

Inventory Products
=============================

Each product or variety of good stored for an account is described with a 
:ref:`products` record.

-----

.. note::
   Setup of billing information for third-party warehousing is included in the 
   billing selections. The rates for billing could (maybe should?) be moved to
   Facility.

.. note::
   http://newwares.aaltsys.com displays a preliminary version of the webWARES 
   program. This is not intended as a completed application. Rather, it is a 
   starting point for alpha-testing program design.
