.. _transactions:

#############################
Inventory Transactions
#############################

Considerations for Tracking
=============================

Inventory transactions are the line entries of documents for receiving, 
shipping, and adjusting inventory. These transactions are the basis for all 
quantitative measurements of inventory. Transaction quantities are signed, so 
that sorting and accumulating transactions will result in accurate inventory 
measurements. 

An Issue of Timing
-----------------------------

A complication of warehouse inventory is that it considers future changes to 
inventory as well as completed actions. Further, these future actions may be 
either general or specific in their application. Here is what this means:

An order can be placed to ship an item. Obviously, placing the order has to 
happen before the item can be shipped, so any order constitutes a future action. 
When an order is placed for a product, the particular lot or unit of inventory 
which will fill the order does not have to be specified. This unit allocation 
can happen at any point between placing the order and picking the shipment. 

Similar questions exist when receiving, where the quantity and condition of 
goods is fully determined only once the goods are physically received.

A Look at Location
-----------------------------

The warehouse has a responsibility to locate goods in its care. Where product 
is unitized or on pallets, the unit location should be recorded in the 
transaction both respect to the unit, and its content. Prior to receipt goods 
may show as in transit, while shipments are the carrier's responsibility.


A Question of Quantity
-----------------------------

Just as timing is an inventory issue, so is quantity. Expected goods may be 
short or over quantity on receipt, or goods may be received with damage. Some 
products experience shrinkage while in storage. Therefore inventory transactions 
allow for over, short, and damaged entries.

A Problem of Mixture
-----------------------------

Goods are typically received or shipped either in floor-loaded trucks, or by 
pallet unit. The process of segregating goods when receiving or consolidating 
products when shipping may result in received or shipped units which are mixed 
by production date, by lot, or by product. It is not enough to know that a 
particular unit shipped; the content of the unit must also be accounted for.

Transaction Design
=============================

The WARES inventory transaction fulfills all the above concerns, and addresses
other questions regarding types of storage and units of measurement. The full 
data layout of this transaction is presented at :ref:`lotlines-schema`.
