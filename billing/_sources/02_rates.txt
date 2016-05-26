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

Rate Identifying Scope 
-----------------------------

Rates are identified by the **Rate Group** and the **Service Code**. All Rates 
belong to some group, and groups are either shared across all accounts or are 
assigned to only one account. This links the rate group directly to the account. 

While the :ref:`bill-services` define the type of service offered, it also 
determines the manner of applying the service. For example, service codes which 
are applied **Repeating** and **Calculated** cannot be used in group **GLOBAL**, 
as **GLOBAL** contains **Optional** rates only. 

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

Entries for scheduling **Repeating** rates are described at 
:ref:`bill-calendar`.

Charge Calculation & Display
=============================

A service may have a single rate or tiered rates, where multiple rates in tiers 
vary with quantity. Charges are calculated from quantities and rates according 
to the following rules.

*  Quantity is required to be positive, the default value is 1.
*  Where the quantity is fractional, the rate is for the fraction stated. For 
   example, labor charged at the rate of $8.00 per quarter hour or fraction
   thereof would have a quantity of .25 and a rate of $8.00. Entered or 
   calculated Amounts will be adjusted to the fractional units of the quantity.
*  A rate entry is required unless the service is optional.
*  The default minimum is the quantity times the rate. Enter a higher amount as 
   desired.
*  Where rates are tiered, the guantities must be listed in ascending order.
*  Tiered rates are calculated to eliminate rate irrationality.

Minimums and Deficits
-----------------------------

Where a **Minimum** charge is part of a rate, and the calculated product of 
**Amount** and **Rate** is less than the Minimum, WARES will apply a **Deficit** 
to satisfy the minimum requirement. For single rates, a Deficit amount always 
increases the extension of a rate to meet a minimum. However, with tiered rates 
a deficit amount may result in a decreased extension, that is, it may be to the 
customer's benefit.

Basic Charge Calculations
-----------------------------

The basic formula to calculate a charge from a rate is: 

| **Deficit** is the larger of:
|
|  (a)  Minimum * ( Factor / Rate ) - Amount 
|  (b)  0
|
| and **Charge** is: 
|
|  ( Amount + Deficit ) * ( Rate / Factor )

Subtle differences in the way a rate is expressed may have significant effects 
on revenue. The following figure shows a variety of charge calculations based 
on similar rate entries to illustrate this point.

.. image:: _images/rate-examples.png

Example 1: Straight Rate
'''''''''''''''''''''''''''''

Where a quantity is 1, the rate will provide a default minimum. In the example, 
a charge of $5.00 is applied to each qualifying activity (UOM = 1R represents 
a transaction). The Minimum is the Rate, and therefore Deficit is always zero.

Example 2: Minimum Applies
'''''''''''''''''''''''''''''

A **Minimum** greater than the **Rate** may apply, and deficient **Amounts** 
will trigger a **Deficit** to result in a charge equal to the minimum. In this 
example a $.32/case pick fee with a minimum equivalent to 5 cases is applied, 
while only 4 cases were picked.

Example 3: Quantity not One
'''''''''''''''''''''''''''''

A decimal **Quantity** may be used for rates expressed in fractional amounts. 
Here MH labor is charged as $8.00 per quarter hour or fraction thereof, with a 
minimum of $16.00, or a half hour of labor. This changes the **Deficit** 
formula to:

|   ( Minimum * Factor * Quantity ) / Rate - Amount

.. tip::
   Decimal quantities apply only with single rates, not tiered rates.

Example 4: Quantity Breaks
'''''''''''''''''''''''''''''

Rates based on economic order quantity (EOQ) provide break pricing for specific 
quantities (cheaper by the dozen) or composite units of measure (PK, CA). This 
example shows Each, Pack, and Case picking charges where the order unit is EA 
(each) but the billing units are by the EOQ.

.. _rate-tiers:

Example 5: Rate Tiers 
-----------------------------

Rate tiers are most interesting pricing option in WARES. A tiered rate may 
provide pricing with step changes (no deficits), with transition deficits 
benefitting the customer, or with transitions deficits penalizing the customer.

In this example, a container stripping fee is charged according to container 
weight. A charge is calculated for a container weighing 39,000 lb. and one 
weighing 40,000 lb.

Part (a): Irrational Rates
'''''''''''''''''''''''''''''

Deficit quantities may be calculated when minimums are used. in part (a), there 
are no minimums and the charge at 40,000 lb. is $12.40 less than the charge at 
39,000 lb. This is considered a pricing irrationality.

Part (b): Beneficial Deficit
'''''''''''''''''''''''''''''

Irrationalities can be eliminated by applying minimums. In part (b), the 
minimums on the second and third line equal the product of Quantity and Rate.
WARES will compare the charge with the minimum at the next break, and if the 
minimum is less, a deficit will be added to move to the next rate level.

for the amount 39,000, the charge is the greater of:

|  (a) the minimum, $72.00, or
|  (b) 39,000 * .36 / 1000.00 = $140.40

Then charge is calculated as the lesser of:

|  (a) the next minimum, $128.00, or
|  (b) the charge calculated previously, $140.40

and if (a) applies, deficit is calculated as the next quantity less the billed 
amount.

The customer receives the benefit of a lower charge by being billed for a 
greater quantity based on the deficit.

Part (c): Penalty Deficit
'''''''''''''''''''''''''''''

To avoid a price reduction for amounts below a break level, minimums should
equal the break Quantity times the Rate of the previous level. In this example, 
the minimum of line 3 is the quantity 40,000 times the previous rate .3600, and 
the minimum of line 2 is the quantity 20,000 times the previous rate .4000.

Now the charge at 39,000 lb. extends to $140.40 just as it did in part (a), and 
this is less than the minimum at the next level of $144.00. This results in a 
deficit quantity of 5,000 at quantity 40,000 so that the charge meets the line 
minimum, $144.00. There is no rate irrationality, but the customer receives 
less benefit from the rate break.

Charge Display
-----------------------------

---

CONSIDERATIONS WHEN ENTERING RATES:

Before any rates are entered, decide what services are being offered 
and what the default, or retail, rates are for those services. When defining a 
list of services, do not over-generalize. For example, do not lump all labor 
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

