.. _contacts:

#############################
Contacts and Addresses
#############################

All name and address information for entities in WARES is stored in the Contacts
database table, making **Contacts** management a fundamental part of the 
technology in WARES. A typical contact record may contain four types of 
information: an entity name, an address, communication entries for email, 
phone, and so forth, and freight configuration options.

A **Type** code prefixes each **Contacts** identifier, and the **Type** 
determines how the contact is used by the program. The default Type Code list 
may be viewed at :ref:`contacts-list`. The following topics show how **Type** 
codes are used for warehouse operations, account management, and shipping 
activities.

Facilities and Accounts
=============================

General accounting programs usually fail to allow for the variety of address 
and contact entities which a company must use. The need for multiple special 
addresses is especially true with logistics services, where shipping, billing, 
and administrative functions are frequently managed from separate locations.

Facility Setup Addresses
-----------------------------

Each warehouse facility master Company record contains links to several contact
addresses. These addresses are typically entered once when the facility is 
first configured, but they may be changed later as required. Facility Contact 
types and addresses are: 

+-------+----------------------------------------------------------------+
| Code  | Description                                                    |
+=======+================================================================+
| C     | The Company general mailing address                            |
+-------+----------------------------------------------------------------+
| SF    | The default Company shipping address                           |
+-------+----------------------------------------------------------------+
| BT    | The Company Bill To address, used for payables                 |
+-------+----------------------------------------------------------------+
| RI    | The Company remittance address, printed on invoices            |
+-------+----------------------------------------------------------------+
| F     | A Company communication record (email, phone, etc.)            |
+-------+----------------------------------------------------------------+
| B     | A warehouse facility or building address for logistics         |
+-------+----------------------------------------------------------------+

Each of these contact types, if present, will provide unique address data for 
the purpose specified. If a type is omitted, the address will default to the 
general company address with type code **C**.

Account Setup Addresses
-----------------------------

.. sidebar:: Account Address Views

   .. image:: _images/contacts-account.png
   .. image:: _images/contacts-account-c.png

Warehouse Accounts, or customers, may use contact addresses as follows:

+-------+----------------------------------------------------------------+
| Code  | Description                                                    |
+=======+================================================================+
| A     | The Account general mailing address                            |
+-------+----------------------------------------------------------------+
| ST    | The Account package receiving address                          |
+-------+----------------------------------------------------------------+
| BT    | The Account Bill To address, for Receivables                   |
+-------+----------------------------------------------------------------+
| PF    | The Account prepaid freight payment address                    |
+-------+----------------------------------------------------------------+

Contact types listed above provide account addresses for specific purposes. 
When an account contact type is omitted, the address used will default to the
general account address with type code **A**.

Entering Account Addresses
-----------------------------

Account address and contact information is usually entered when setting up a 
new account, and it is updated as neccessary on instruction from the client. 
Each account Contacts record uses the **Account** identifier, but with varing 
**Type** code entries to distinguish the separate records. An example account 
address record is shown in the side bar.

Communication entries are certainly needed for Accounts, and sometimes for other 
addresses as well. Each communication entry may be labeled using either standard 
codes or custom entries, as selected from :ref:`label-list`.

.. note::
   **Account** linking entries and **Freight Pay** codes are not used and not 
   entered for addresses associated with an Account Setup, or with Facility
   Setup either. These entries are protected or hidden for the type codes 
   listed in these sections.

Ship-From and Ship-To Addresses
===============================

Warehouses produce logistics documents for warehouse receiving services and for 
outbound shipping. Each document may contain several addresses to satisfy all 
the document requirements. These addresses, many of which were mentioned 
previously, are given in the following two tables.

Receiving Logistics Documents
-----------------------------

.. sidebar:: Shipping Addresses

   .. image:: _images/contacts-shipto.png
   .. image:: _images/contacts-shipto-c.png

A Warehouse Receipt document may include the following addresses:

+-------+----------------------------------------------------------------+
| Code  | Description                                                    |
+=======+================================================================+
| ST, B | The receipt destination point, or warehouse building address   |
+-------+----------------------------------------------------------------+
| SF, VN| The shipped from origination point or vendor address           |
+-------+----------------------------------------------------------------+
| A     | The Account general mailing address and communication record   |
+-------+----------------------------------------------------------------+
| C, RI | The warehouse company remittance address, if invoiced          |
+-------+----------------------------------------------------------------+

Shipping Logistics Documents
-----------------------------

In Third-Party logistics, the Bill of Lading should present the following four 
addresses:

+-------+----------------------------------------------------------------+
| Code  | Description                                                    |
+=======+================================================================+
| SF, B | The shipment origination point, or warehouse building address  |
+-------+----------------------------------------------------------------+
| ST, CN| The shipment consignee or receiving address or location        |
+-------+----------------------------------------------------------------+
| A     | The Account general mailing address and communication record   |
+-------+----------------------------------------------------------------+
| PF    | The Freight Payor's address, based on freight payment terms    |
+-------+----------------------------------------------------------------+

Most of these addresses are defined during Facility setup and Account entry, 
with the exception of Ship-From and Ship-To contacts. Where goods come from, 
and where they are going to, may have to be entered for each receipt or 
shipment. An example **Ship-To** contact record is shown to the right.

This contact is linked to the **Account** associated with the inventory, and 
if necessary, a **FreightPay** code may be entered to override account settings.

Other Contact Entity Names
=============================

.. sidebar:: Other Contacts

   .. image:: _images/contacts-carrier.png
   .. image:: _images/contacts-carrier-c.png

Additional Contact entity types are used throughout WARES, as listed in the 
following table.

+-------+------------------------------------------+---------------------+
| Code  | Description                              | Where Used          |
+=======+==========================================+=====================+
||      |                                          || Location Setup     |
|| B    | Warehouse building address               || Warehouse Receipts |
||      |                                          || Bills of Lading    |
+-------+------------------------------------------+---------------------+
| E     | Warehouse employee name                  | Activity tracking   |
+-------+------------------------------------------+---------------------+
+-------+------------------------------------------+---------------------+
| T     | EDI trading partner                      | Data Exchange       |
+-------+------------------------------------------+---------------------+
+-------+------------------------------------------+---------------------+
|| CA   | Freight carrier                          || Warehouse Receipts |
||      |                                          || Bills of Lading    |
+-------+------------------------------------------+---------------------+

Of these Contacts, freight carriers commonly need to be entered apart from 
Facility Setup and Account Entry. An example carrier contact is displayed in 
the sidebar.

Contacts Database Schema
=============================

The Contacts database column schema can be found at :ref:`contacts-schema`.

 
