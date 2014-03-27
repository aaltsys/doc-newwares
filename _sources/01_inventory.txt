.. _inventory:

#############################
Inventory Concepts
#############################

Product Organization
=============================

Inventory is a listing of goods held in local storage or bailment, which may be
organized by:

+---------------+-------------------------------------------------------------+
| **Data Name** | **Other descriptions or uses**                              |
+===============+=============================================================+
| IDENTIFIER    | Master identifier used by inventory system                  |      
+---------------+-------------------------------------------------------------+
| PRODUCT       | Product code, stock number, catalog code, buyer's number ...|
+---------------+-------------------------------------------------------------+
| CONTROL       | Lot number, batch, job, production code, date code, ...     |
+---------------+-------------------------------------------------------------+
| UNIT          | Handling unit: pallet, roll, coil, bundle, bag, billet, ... |
+---------------+-------------------------------------------------------------+
| CONTENT       | Countable sub-unit: case, carton, box, sack, ...            |
+---------------+-------------------------------------------------------------+
| INNER         | Enclosed packages: inner pack, each, piece ...              |
+---------------+-------------------------------------------------------------+

Each product and lot is categorized by an array of codes and values to describe 
the item. Links to the code lists for products and lot control follow:

+---------------+------------------------------------+
| **Data Name** | **Code list**                      |
+===============+====================================+
| PRODUCT       | :ref:`product-list`                |
+---------------+------------------------------------+
| CONTROL       | :ref:`control-list`                |
+---------------+------------------------------------+

Units of Measure
=============================

Product inventory is counted by handling units (UNIT), their countable contents 
(CONTENT), and any inner elements (INNER). The classic case of inventory is a 
pallet of cartons, with each carton uniformly filled with inner packs or eaches. 
Products deviate from this configuration, and so the breakdown of UNIT, CONTENT, 
and INNER, along with weights and measures, must be specified for each product. 

For further reference, see this Table of Industry Standard 
:ref:`uom-list`.


As stated previously, inventory is measured or counted in units which build up 
from smallest shippable quantity to largest handling unit. The master product 
record entry relates the standard set of units and weights for a product as 
follows:

+----------+---------+-----------+------------------------------+-------------+
| **Qty**  | **UOM** | **Count** | **Net Weight**               | **Tare Wt** |
+==========+=========+===========+==============================+=============+
| INNER    | EA, ... | PCS       | WGHT                         | (N/A)       |
+----------+---------+-----------+------------------------------+-------------+
| CONTENT  | CA, ... | CNT       | NET = PCS X WGHT             | PKG         |
+----------+---------+-----------+------------------------------+-------------+
| UNIT     | PL, ... | 1         | UNET = CNT X ( NET + PKG )   | TARE        | 
+----------+---------+-----------+------------------------------+-------------+

Individual units may be received with unique values for the inner PCS count and
WGHT, the content CNT, NET, and PKG, or handling/shipping unit UNET and TARE 
weights. 

Quantity Setup Considerations
=============================

There are exceptions to every inventory tracking system, but almost every type 
of product can be tracked with proper setup. The following table shows example 
product setup values for a variety of product categories commonly stored in 
warehouse inventory:

+--------------------+-----------------+-----------------------+-----------------+
|                    | INNER ----------| CONTENT --------------| UNIT ---------- | 
+--------------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| **Description**    | UOM | PCS | WGHT| UOM | CNT | NET | PKG | UOM | UNET| TARE|
+====================+=====+=====+=====+=====+=====+=====+=====+=====+=====+=====+
| innerpacked cartons| PK  | 12  | 1.2 | CA  | 96  | 14.4| 1.0 | PL  | 1382| 65  |
+--------------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| each packed cartons| EA  | 144 | .12 | CA  | 54  | 17.3| 2.0 | PL  | 1041| 65  |
+--------------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| cartons on pallets | -- -- -- --     | CA  | 48  | 21.0| 1.0 | PL  | 1056| 65  |
+--------------------+-----------------+-----+-----+-----+-----+-----+-----+-----+
| knock-down cartons | -- -- -- --     | CT  | 810 | 2.1 |     | BD  | 1701| 20  |
+--------------------+-----------------+-----+-----+-----+-----+-----+-----+-----+
| sack/bag product   | -- -- -- --     | BG  | 40  | 50.0| 0.5 | PL  | 2020| 75  |
+--------------------+-----------------+-----+-----+-----+-----+-----+-----+-----+
| empty soda cans    | -- -- -- --     | EA  | 6000| 0.1 |     | PL  | 600 | 200 |
+--------------------+-----------------+-----+-----+-----+-----+-----+-----+-----+
| pails on pallets   | -- -- -- --     | PA  | 36  | 50.0| 1.5 | PL  | 1854| 75  |
+--------------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| dbl-pack paper roll| FT  | 550 |     | RL  | 2   | 1157|     | PK  | 2315| 55  |
+--------------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| measured paper roll| -- -- -- --     | FT  | 1100|     |     | RL  | 2315| 55  |
+--------------------+-----------------+-----+-----+-----+-----+-----+-----+-----+
| flooring roll      | -- -- -- --     | FT  | 500 | 5.0 |     | RL  | 2500|     |
+--------------------+-----------------+-----+-----+-----+-----+-----+-----+-----+
| steel coil         | -- -- -- --     | FT  | 1000| 6.0 |     | CI  | 6000| 200 |
+--------------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| liquid drums       | GL  | 55  | 8.3 | DR  | 4   | 457 | 47  | PL  | 2016| 75  |
+--------------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| liquid tote tank   | -- -- -- --     | GL  | 300 | 8.3 |     | TE  | 2490| 75  |
+--------------------+-----------------+-----+-----+-----+-----+-----+-----+-----+

The Unit of Measure (UOM) entries for a product are set on the masterfile 
record, but masterfile quantity entries (PCS, WGHT, CNT, NET, PKG, UNET, TARE) 
are defaults of values which are entered separately for each received unit.
 
