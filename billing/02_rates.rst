.. bill-rates:

#############################
Using Billing Rates
#############################

Setting up rates starts with analyzing customer contracts. A customer agreement
should show a customer the services offered and charges billed for those 
services, and it guarantees the logistics company that they will be fairly 
compensated for services rendered.

Rate Quote Sections
=============================

An example partial rate quote is shown following to demonstrate how rates are 
presented to the customer with WARES. There are four sections to the report, 
determined by entries in the **Account** and **Group** columns.

.. image:: _images/rate-quote.png

Private Rates by Account 
-----------------------------

ACCOUNT = **ABF**, GROUP = **ABF**:

Rates grouped by the account identifier (ABF) appear first on the quote. These 
rates are private to the account, and each service code listed in this group 
will override a corresponding rate in the general group **GLOBAL**.

Private Rates by Group 
-----------------------------

ACCOUNT = **ABF**, GROUP = user-defined:

Other groups which are restricted by the account identifier provide multiple 
rate sets for an account, particularly for calculated storage and handling. 
If an account identifier is entered on the first rate in a group, the account 
is added and protected on all rates in the group.

Shared Rates by Group
-----------------------------

ACCOUNT blank, GROUP = user-defined:

Where services and their rates are shared with multiple accounts, a shared 
group is available to all accounts. If the account is left blank on the first 
rate in a group, subsequent rates in the group will be shared as well.

Rates in group GLOBAL
-----------------------------

ACCOUNT blank, GROUP = **GLOBAL**

The **GLOBAL** group, which sets default service rates for all accounts, appears 
last on the report. Account is blank and protected for all **GLOBAL** entries. 
When a service code is used on a rate in an account group, any corresponding 
**GLOBAL** rate is suppressed for that account.

.. note::
   #. In the example report, the **GLOBAL** section shows Codes **L1** and 
      **L2**. The code **L3** appears in the private account group **ABF**, and
      so this code is suppressed in group **GLOBAL** for customer **ABF**.
   #. Codes **1H**, **1R**, and **1S** are used in both private groups for 
      **ABF** and the shared group **FRZ-RK**. Codes used in private groups do 
      not override the same codes in shared groups.
   #. GLOBAL rate **F2** is a tiered rate. The actual amount charged depends on 
      the quantity, as described in :ref:`rate-tiers`.
   #. Rates in the **GLOBAL** group are always **Optional**. 

Columns in a Rate Quote
=============================

Descriptions of the displayed report columns are as follows:

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

These columns show a customer the rates which will be charged for services. 
More information is required to complete a rate definition, such as the 
calendar for a repeating rate, the activity which triggers a mandatory charge, 
and the method of converting from inventory or activity quantities to the 
chargeable quantities indicated by the billing units of measure.

Rates Entries
=============================



ENTERING RATES:

Rates may be modified or added at any time.  A rate should not be edited or 
deleted when open transactions exist with the charge applied to them.  Please 
refer to CONSIDERATIONS WHEN ENTERING RATES before entering rates for the 
first time.


CONSIDERATIONS WHEN ENTERING RATES:

Before any rates are entered, one must decide what services are being offered 
and what the default, or retail, rates are for those services.  When defining a 
list of services, do not over-generalize.  For example, do not lump all labor 
services into a single heading, when they can be broken down into specific 
activities such as RESTACKING, PACKAGING, RELOCATING, and so forth.

Global Rates: Once your business services are identified, enter a global 
rate for each optional service using the highest rate charged.  These rate 
records should be grouped under one rate name, for example, rate "GLOBAL".  
Leave the Account blank on these records, and set Apply to "Optional".  These 
Rates may be applied by hand on any account.

Override Rates: For negotiated rates on each account, use the account 
identifier as the Tariff Key and enter the same code as the global service code 
for that service.  Enter the Account identifier in the Account field as well.  
This causes the negotiated rate to override the global rates for a service.

Mandatory Rates: Where a transaction should always generate a charge, enter a 
rate for the service with Apply set to "Mandatory".  Then a charge will be 
added to each specified transaction on the rateed account.  Generally 
Mandatory rates should be assigned to specific accounts.  Mandatory rates 
are applied during Charges Calculation, or when changing a record's status to 
billed.

Repeating Rates: When a charge is not based on a transaction, but is applied 
periodically instead, the rate for the charge should be made repeating.  
Charge records for repeating rates are created during Charges Calculation, 
when either "Only" or "Also"" is entered for "Apply Repeating Charges".  
Repeating rates are applied based on the rate schedule.

An example of a repeating rate would be a lease charge.  This charge might be 
created on the first day of the month for the current month (current), on the 
last day of the month for the future month (advance), or on the last day of the 
month for the current month (arrears).  The schedule would be based on 
"MONTHDAYS", using the date value of "FIRST" for current billing and "LAST" for 
either advance or arrears billing.

Calculated Rates: Frequently charges are calculated based on discounts, 
prorating, and other considerations.  These rates are defined in the 
rates window, but special input parameters and billing calculations may be 
necessary to calculate the charges.  When charges are calculated by special 
routines, the corresponding rates must be applied as "Calculated".  An example 
of calculated rates is the storage and handling charges in a warehousing 
module.

Multiple Rates: Typically optional and mandatory rate codes are assigned by 
account, while calculated rates are often assigned based on a grouping within 
an account.  A particular calculated rate name may require multiple codes in 
an account.

RATES AND INVOICES:

