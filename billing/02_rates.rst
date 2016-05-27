.. _bill-rates:

#############################
Billing Rates
#############################

While warehouse services are codified in legal and contractual terms, the 
warehouse services are priced for a customer through a Rate Quote. In addition 
to pricing services, WARES rates provide the mechanics of capturing services 
and billing the customer for them. Entering rates requires considering both the 
pricing aspect of rates and the application of rates to warehouse activity.

Rate Quote Information 
=============================

A **Rate Quote** shows the customer services being offered and charges to be 
billed for those services. Further, it guarantees the logistics company that 
they will be fairly compensated for services rendered. Knowing the information
in a rate quote is crucial before entering rates. The WARES **Rate Quote** 
displays a table of the following columns:

+-------------+------------------------------------------------------------+
| Heading     | Description or Explanation                                 |
+=============+============================================================+
| Account     | Customer Account Identifier                                |
+-------------+------------------------------------------------------------+
| Group       | Groups organize Rates for management                       |
+-------------+------------------------------------------------------------+
| Code        | Service Code identifies each service offered by company    |
+-------------+------------------------------------------------------------+
| OMCR        | Applied (O)ptional, (M)andatory, (C)alculated, (R)epeating |
+-------------+------------------------------------------------------------+
| UOM         | Billing unit of measure (UOM) code for quantity            |
+-------------+------------------------------------------------------------+
| Description | Invoice/Billing Description of the service                 |
+-------------+------------------------------------------------------------+
| Rate        | Nominal Rate per unit quantity of service                  |
+-------------+------------------------------------------------------------+
| Quantity    | Quantity level corresponding to the rate                   |
+-------------+------------------------------------------------------------+
| Minimum     | Minimum charge applied for this service                    |
+-------------+------------------------------------------------------------+

Example of Quote Sections 
=============================

An example partial rate quote is shown following to demonstrate how rates are 
presented to the customer with WARES. There are four sections to the report, 
determined by entries in the **Account** and **Group** columns.

.. image:: _images/rates-quote.png

Sec. 1: Private Rates by Account 
--------------------------------

ACCOUNT = **ABF**, GROUP = **ABF**:

Rates grouped by the account identifier (ABF) appear first on the quote. When 
entering rates in an account group, the account entry, **ABF** in this case, 
will be automatically filled and protected. These rates are private to the 
account, and a service code listed in this group will override a corresponding 
rate in the general group **GLOBAL**.

Sec. 2: Private Rates by Group 
--------------------------------

ACCOUNT = **ABF**, GROUP = user-defined:

Other groups which are restricted by the account identifier provide multiple 
rate sets for an account, particularly for calculated storage and handling. 
If an account identifier is entered on the first rate in a group, the account 
is added and protected on all rates in the group.

Sec. 3: Shared Rates by Group
--------------------------------

ACCOUNT blank, GROUP = user-defined:

Where services and their rates are shared with multiple accounts, a shared 
group is available to all accounts. If the account is left blank on the first 
rate in a group, subsequent rates in the group will be shared as well.

Sec. 4: Shared GLOBAL Rates
--------------------------------

ACCOUNT blank, GROUP = **GLOBAL**:

The **GLOBAL** group, which sets default service rates for all accounts, appears 
last on the report. Account is blank and protected for all **GLOBAL** entries. 
When a service code is used on a rate in an account group, any corresponding 
**GLOBAL** rate is suppressed for that account.

Notes on Quotes Example
-----------------------------

#. In the example report, the **GLOBAL** section shows Codes **L1** and 
   **L2**. The code **L3** appears in the private account group **ABF**, and 
   so this code is suppressed in group **GLOBAL** for customer **ABF**. 
#. Codes **1H**, **1R**, and **1S** are used in both private groups for 
   **ABF** and the shared group **FRZ-RK**. Codes used in private groups do 
   not override the same codes in shared groups. 
#. GLOBAL rate **F2** is a tiered rate. The amount charged per unit depends on 
   the quantity, as described in :ref:`rate-tiers`. 

Rates Entries
=============================

In addition to the **Rate Quote** entries, WARES needs the activity information 
which triggers a mandatory charge, the conversion of activity quantities into 
billing units of measure, and the calendar for a repeating rate. The full 
information for a rate can be broken down into three sections: the scope for 
applying a rate, the rate calculation and display, and the repeating calendar. 
This section details these rate parts. 

The :ref:`rates-schema` may be viewed here for information.

Rate Identifying Scope 
-----------------------------

Rates are identified by the **Rate Group** and the **Service Code**. All Rates 
belong to some group, and groups are either shared across all accounts or are 
assigned to one account, linking the group's rates directly to the account. 

While the :ref:`bill-services` define the type of service offered, they also 
determine the manner of applying a service. For example, service codes which 
are applied **Repeating** and **Calculated** cannot be used with rates in group 
**GLOBAL**, as **GLOBAL** contains **Optional** rates only. 

Similarly putting **Mandatory** or **Repeating** rates in a group which is not 
associated to an account is possible, but not recommended. For example, if 
every account receives the same charge for say, Bills of Lading, then a shared 
group without an account could include the **Mandatory** Bill of Lading service. 
But: entering a rate with the same service code in an account group would result 
in two charges, because account-associated rates override **GLOBAL** rates, but 
not rates in other shared groups.

The following figure shows identifying entries for rates:

.. image:: _images/rates-id.png

Rate Activity Scope
-----------------------------

Rates link to warehouse activities through a list of activity codes, where each
activity uses a **Per** code to convert activity quantity units into the rate's
billing units. When a rate is associated with an activity list, the rate is 
restricted to only that list of activities.

.. note::
   Where a standard per code cannot return a usable quantity, or if the payer of 
   a charge is not the account, then custom program methods may be required. 
   Optional method entries are provided to enable these custom features.

Rules Regarding Rate Scope
-----------------------------

A rate record identifies how to use a warehouse service code when applying
charges to an account. Rules which determine how to apply rates follow:

#. Either a rate is restricted to a single account, or it is shared with all 
   accounts, depending on whether the **Account** entry is filled. 
#. All rates in a group must have the same account entry. When one rate in a 
   group is associated with an account, all rates in the same group must be 
   filled with the same account as well.
#. An optional rate may be restricted to one or more activities, or it may be 
   applicable to all activities. 
#. All rates which are not optional must be associated with an activity so that 
   the rate can be calculated to produce charges.
#. Rates in an **Account** group override **GLOBAL** rates for the same service. 

Additional Rates Properties
-----------------------------

#. Any one service code can appear only once in a group. 
#. Optional rates are charged through user entry, and all other rates are 
   charged by system routines.
#. Rates in the **GLOBAL** group are always **Optional**. 

Rates Setup Considerations 
=============================

Before any rates are entered, decide what services are being offered 
and what the default, or retail, rates are for those services. When defining a 
list of services, do not over-generalize. For example, do not lump all labor 
services into a single heading, when they can be broken down into specific 
activities such as RESTACKING, PACKAGING, RELOCATING, and so forth.

Global Rates: Once your business services are identified, enter a rate in group
**GLOBAL** for each optional service using the highest rate charged. 

Override Rates: Group negotiated rates on each account under the account 
identifier, using the same service codes as in group **GLOBAL**. These 
negotiated rates will override default global rates for a service.

Mandatory Rates: **GLOBAL** rates are only optional. Where a transaction always 
generates a charge, enter a rate for the service in the account's group with 
Apply set to **Mandatory**.

Repeating Rates: When a charge is not based on a transaction, but is applied 
periodically instead, the rate for the charge should be made **Repeating**. A 
:ref:`bill-calendar` is required for calculating every repeating rate.

Calculated Rates: Special billing calculations are necessary to determine 
charges for rates which are based on properties beyond the amounts of a 
transaction. Warehouse storage and handling charges depend on product 
characteristics, and these rates are calculated accordingly. Each product 
master record identifies the rate group specific to that product.


