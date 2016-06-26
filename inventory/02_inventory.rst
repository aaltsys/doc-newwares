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
| PACKAGE       | Countable sub-unit: case, carton, box, sack, ...            |
+---------------+-------------------------------------------------------------+
| INNER         | Enclosed items: inner pack, each, piece ...                 |
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

Product inventory is measured by countable packages (PACKAGE), which may be 
accumulated into handling units (UNIT), and subdivided into inner elements 
(INNER). The basis for inventory counts or measures is specified with Units of 
Measure (UOMs) particular to each product. For further reference, see this 
Table of Industry Standard :ref:`uom-list`.

The classic case of inventory is a pallet (unit) of cartons (packages), with 
each carton uniformly filled with inner packs or eaches. Products deviate from 
this ideal configuration, and so the dimensional analysis of UNIT, PACKAGE, and 
INNER, along with weights and measures, must be entered separately for each 
product. Further, the inventory of lots and units of a product may deviate from 
the product definition, and so inventory documents must record the exact counts
and measures for every transaction.

When defining products, the units of dimension are built up from the smallest 
shippable quantity to the largest handling unit. The master product entries
generate default values for content and unit weights and sizes as follows:

+---------+-------+-------+-------------------------------+--------+---------------------+
| Qty     | UOM   | Count | Net Weight                    | Tare Wt| Dimension           |
+=========+=======+=======+===============================+========+=====================+
| INNER   | EA,...| PCS   | WGHT                          | (N/A)  | ISIZE               |
+---------+-------+-------+-------------------------------+--------+---------------------+
| PACKAGE | CA,...| CNT   | NET = PCS X WGHT              | TARE   | SIZE = ISIZE X PCS  |
+---------+-------+-------+-------------------------------+--------+---------------------+
| UNIT    | PL,...| 1     | UNET = CNT X ( NET + TARE )   | UTARE  | USIZE = SIZE X CNT  |
+---------+-------+-------+-------------------------------+--------+---------------------+

Individual units may be received with unique values for the inner PCS count, 
WGHT, and ISIZE, the package CNT, NET, TARE, and SIZE, or handling/shipping 
unit UNET and UTARE weights and the USIZE. 

Quantity Setup Considerations
=============================

Almost every product can be tracked with proper setup, with rare exceptions. 
The following table shows example product setup values for a variety of product 
categories commonly stored in warehouse inventory:

.. tabularcolumns:: |L|L|R|R|L|R|R|R|L|R|R|

+--------------------+-----------------+------------------------+------------------+
|                    | INNER -- -- --  | PACKAGE -- -- -- -- -- | UNIT -- -- -- -- | 
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| Description        | UOM | PCS | WGHT| UOM | CNT | NET | TARE | UOM | UNET| UTARE|
+====================+=====+=====+=====+=====+=====+=====+======+=====+=====+======+
| innerpacked cartons| PK  | 12  | 1.2 | CA  | 96  | 14.4| 1.0  | PL  | 1382| 65   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| each packed cartons| EA  | 144 | .12 | CA  | 54  | 17.3| 2.0  | PL  | 1041| 65   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| cartons on pallets | --  | --  | --  | CA  | 48  | 21.0| 1.0  | PL  | 1056| 65   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| knock-down cartons | --  | --  | --  | CT  | 810 | 2.1 |      | BD  | 1701| 20   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| sack/bag product   | --  | --  | --  | BG  | 40  | 50.0| 0.5  | PL  | 2020| 75   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| empty soda cans    | --  | --  | --  | EA  | 6000| 0.1 |      | PL  | 600 | 200  |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| pails on pallets   | --  | --  | --  | PA  | 36  | 50.0| 1.5  | PL  | 1854| 75   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| dbl-pack paper roll| FT  | 550 |     | RL  | 2   | 1157|      | PK  | 2315| 55   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| measured paper roll| --  | --  | --  | FT  | 1100|     |      | RL  | 2315| 55   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| flooring roll      | --  | --  | --  | FT  | 500 | 5.0 |      | RL  | 2500|      |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| steel coil         | --  | --  | --  | FT  | 1000| 6.0 |      | CI  | 6000| 200  |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| liquid drums       | GL  | 55  | 8.3 | DR  | 4   | 457 | 47   | PL  | 2016| 75   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| liquid tote tank   | --  | --  | --  | GL  | 300 | 8.34|      | TE  | 2502| 75   |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| machinery          | --  | --  | --  | SF  | 30  |     |      | EA  | 2913|      |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| bulk tank          | --  | --  | --  | GL  |50000| 8.34|      | BN  |     |      |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+
| bulk pallets       | --  | --  | --  | EA  |     | 75  |      | BN  |     |      |
+--------------------+-----+-----+-----+-----+-----+-----+------+-----+-----+------+

Product Setup
=============================

A product's Unit of Measure (UOM) entries are set on the Product masterfile 
record, but masterfile quantity entries (PCS, WGHT, CNT, NET, TARE, SIZE, UNET, 
UTARE, USIZE) are defaults of values which may be entered separately for each 
received unit.

:ref:`products` provides a detailed description for entering products. 
