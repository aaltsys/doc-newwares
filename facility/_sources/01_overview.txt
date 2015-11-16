.. _facility:

#############################
Facility Setup Overview
#############################

A facility is a single warehouse business which stores and manages goods for 
multiple accounts kept in one or more buildings. Use **Facility** selections to 
setup information about a warehouse company, its accounts, and its products.

Warehousing Company
=============================

Each instance of WARES is used by one warehousing company. The identifier and 
contact information for the warehouse is displayed in this form, along with 
control data for the :ref:`company`. 

Contacts and Addresses
=============================

Address information is collected in a single table of :ref:`contacts`. Before 
an address identifier can be used in Facility Setup or elsewhere in WARES, the
contact or address must first be entered here.

Customer Accounts
=============================

For private warehousing, accounts might be departments or divisions in the 
company ledgers. Public warehouses use one or more unique :ref:`accounts` for 
each warehouse customer. 

Buildings and Locations
=============================

A warehouse company is responsible for goods under management in physical 
buildings and locations within and around them. Information to describe these 
locations is entered in :ref:`locations`.

Inventory Products
=============================

Each of the :ref:`products` in the warehouse belongs to an account, and each 
product or variety of good stored for an account is described with a product 
record.

-----

.. note::
   Setup of billing information for third-party warehousing is included in the 
   billing selections. The rates for billing could (maybe should?) be moved to
   Facility.

.. note::
   http://newwares.aaltsys.com displays a preliminary version of the webWARES 
   program. This is not intended as a completed application. Rather, it is a 
   starting point for alpha-testing program design.
