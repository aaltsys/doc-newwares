.. _accuracy:

#############################
Inventory Accuracy
#############################

Inventory counts in the information system should agree with actual stock on the 
warehouse floor. Warehouses with picking activity are likely to encounter 
discrepancies, and so procedures must exist to identify errors, to quantify 
accuracy, and to correct mistakes.

The following topics survey the types of inventory errors in warehousing, and 
the general methods for correcting them in WARES.

.. _id-errors:

Inventory Identity Errors
=============================

Sometimes the product in a location is not the product showing in inventory as 
having been received and located there. If the product was misidentified on 
receipt, the customer might catch the error when reviewing warehouse receipts, 
or more likely, when reconciling inventory with the warehouse. If the warehouse 
finds the misidentification when picking or when counting, then the warehouse 
should pull the files for the original receipt and compare data entries to the 
inbound packing slip. Then enter an adjustment to withdraw the incorrect product 
and add the correct one.

.. _loc-errors:

Inventory Location Errors
=============================

A location may show double occupancy, or a location may be empty when a product 
is expected, and so the product's actual location is unknown. 

Location errors are discovered when cycle counting or when picking. Search the 
warehouse backwards through the location history, looking left, right, and 
across the aisles, to find the missing unit.

A location transfer corrects a mislocation. Using an unbalanced adjustment to 
remove a mislocated unit means that now the inventory will be wrong by one unit. 
If a unit is not found, move it to location UNKNOWN.

.. _quan-errors:

Inventory Quantity Errors
=============================

For quantity errors on receipts, the document hash totals will not match the 
inbound packing slip, or the charges on the warehouse receipt may be obviously 
wrong. Consider the effect on billing for any wrong receipt, and notify the 
customer of the error. Otherwise the warehouse is liable for missing inventory.

Shipments may produce quantity errors when the wrong unit is shipped, or when 
the wrong measure is picked: a content carton is shipped instead of an inner, 
for example.

Correct inventory quantity errors with adjustments to products, lots, or units.

Inventory Reconciliation
=============================

The warehouse provides customers with periodic inventory reports, along with 
lists of the transactions inclucded on the warehouse books. Customers then 
reconcile their inventory counts to the warehouse. 

The warehouse posts receipts when goods arrive, are unloaded, counted, and put 
away. Similarly shipments are posted after goods are loaded and signed for by 
the carrier. By contrast, the typical procedure in customer accounting is to 
post receipts when invoiced upon shipment, and to post shipments when orders are 
transmitted to the warehouse. 

There are timing issues in posting inventory between the warehouse and the 
customer, SO Warehouse inventory should not be adjusted to agree with the 
customer's books unless there is good reason to believe that a warehouse error 
exists.

.. _cycle-count:

Cycle Counting 
=============================

In cycle counting, a  statistical measure of inventory accuracy is derived from
frequent location accuracy checks performed on random selections of locations.
Errors are corrected by adjustments, although this may be problematic, as noted 
in :ref:`loc-errors`. Effective cycle counting requires unit tracking.

As an alternative to location cycle counts, a warehouse customer may request 
counts of randomly selected products, thereby giving the customer a measure of 
warehouse inventory accuracy. With this procedure, the warehouse reports 
mislocations and corrects them with relocations, not adjustments.

.. _full-count:

Physical Inventory Counts
=============================

Annually or at agreed times, the warehouse may perform a complete location 
count of a customer's physical inventory. After taking care of any location 
errors, adjustments are required to reconcile the warehouse books to the 
physical inventory counts. Note that unit tracking allows location errors to be 
identified separately from quantity errors.
