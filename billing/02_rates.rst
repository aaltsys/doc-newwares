.. bill-rates:

#############################
Using Billing Rates
#############################

In progress.



Calendar Information
-----------------------------

Repeating tariffs may be applied by Every Day, Week Days, Month Days, Year Days, 
and Year Dates.  Select the appropriate radio button for this tariff.  Next, 
enter the desired Values for this schedule.  Enter a Last Date value to specify 
when the tariff will start to be applied, and enter an Expire Date if the tariff 
should be discontinued.  Next Date is calculated by the system based on the 
other entries.

---

ENTERING TARIFFS:

Tariffs may be modified or added at any time.  A tariff should not be edited or 
deleted when open transactions exist with the charge applied to them.  Please 
refer to CONSIDERATIONS WHEN ENTERING TARIFFS before entering tariffs for the 
first time.


CONSIDERATIONS WHEN ENTERING TARIFFS:

Before any tariffs are entered, one must decide what services are being offered 
and what the default, or retail, rates are for those services.  When defining a 
list of services, do not over-generalize.  For example, do not lump all labor 
services into a single heading, when they can be broken down into specific 
activities such as RESTACKING, PACKAGING, RELOCATING, and so forth.

Global Tariffs: Once your business services are identified, enter a global 
tariff for each optional service using the highest rate charged.  These tariff 
records should be grouped under one tariff name, for example, tariff "GLOBAL".  
Leave the Account blank on these records, and set Apply to "Optional".  These 
Tariffs may be applied by hand on any account.

Override Tariffs: For negotiated rates on each account, use the account 
identifier as the Tariff Key and enter the same code as the global service code 
for that service.  Enter the Account identifier in the Account field as well.  
This causes the negotiated tariff to override the global rates for a service.

Mandatory Tariffs: Where a transaction should always generate a charge, enter a 
tariff for the service with Apply set to "Mandatory".  Then a charge will be 
added to each specified transaction on the tariffed account.  Generally 
Mandatory tariffs should be assigned to specific accounts.  Mandatory tariffs 
are applied during Charges Calculation, or when changing a record's status to 
billed.

Repeating Tariffs: When a charge is not based on a transaction, but is applied 
periodically instead, the tariff for the charge should be made repeating.  
Charge records for repeating tariffs are created during Charges Calculation, 
when either "Only" or "Also"" is entered for "Apply Repeating Charges".  
Repeating tariffs are applied based on the tariff schedule.

An example of a repeating tariff would be a lease charge.  This charge might be 
created on the first day of the month for the current month (current), on the 
last day of the month for the future month (advance), or on the last day of the 
month for the current month (arrears).  The schedule would be based on 
"MONTHDAYS", using the date value of "FIRST" for current billing and "LAST" for 
either advance or arrears billing.

Calculated Tariffs: Frequently charges are calculated based on discounts, 
prorating, and other considerations.  Rates for these tariffs are defined in the 
tariffs window, but special input parameters and billing calculations may be 
necessary to calculate these charges.  When charges are calculated by special 
routines, the corresponding tariffs must be applied as "Calculated".  An example 
of calculated tariffs is the storage and handling charges in a warehousing 
module.

Multiple Tariffs: Typically optional and mandatory tariff codes are assigned by 
account, while calculated tariffs are often assigned based on a grouping within 
an account.  A particular calculated tariff name may require multiple codes in 
an account.

For example, a warehouse may charge customers three different storage rates 
depending on whether the goods are stored dry, cooled, or frozen.  Then each 
account might have three storage tariffs.  For account "ABC", these three 
tariffs would each using code "1S" for storage.  The tariff codes might be 
"D-ABC", "C-ABC", and "F-ABC" for dry, cooled and frozen respectively.  Each of 
ABC's products would be assigned to one of the three tariffs based on the type 
of storage required.

Sharing Tariffs: Where tariffs are assigned to groupings rather than accounts, 
they may be shared by multiple accounts.  For example, a warehouse may have one 
standard rate for storing sacks of coffee beans.  By entering tariff "SACK" 
without an account, this tariff could be used on coffee sack products for any 
account.

CODE TABLE MAINTENANCE:

Codes may be edited or added to the list by pressing [Ctrl+G] while in the Code 
field or select Manage/Design/Code Lists from the menu. 


TARIFFS AND INVOICES:

===
Enter the Tariff group identifier, or lookup with:

text$	Where "text" is part of a word from the account name,
[Ctrl+D]	To select a tariff from an index value list, or
[Ctrl+Q]	To select tariff records using the Query window.

Tariff records may be retrieved by the account name. Enter part of a word from 
the name to start an index search. For example, enter "PAPER$" to select a 
record from a popup list of tariffs for account "Paper The Walls".

Press [Ctrl+D] to see an index value list. Select a tariff group identifier 
from this list to recall a tariff or to add a rate to an existing tariff.

Each unique service charge which may be applied requires a separate tariff rate 
record. These records are identified by the combination of a tariff group 
identifier and a rate code.
---
Enter a Tariff service code, or press

[Ctrl+D]	to select a code from an options list.

Enter a rate or tariff identifier code. Each defined rate in a tariff is 
associated with a code.  Each unique service charge which may be applied 
requires a separate tariff rate record. These records are identified by the 
combination of a tariff group identifier and a rate code.

The list of available tariff codes is maintained in a codes table.  Press 
[Ctrl+G] to edit the Tariff codes setup.

