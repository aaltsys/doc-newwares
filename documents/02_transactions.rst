.. _transactions:

#############################
Document Lines Detail
#############################

Document lines provide the transactions for inventory control and location 
tracking. These lines contain identifying, control, descriptive, and 
quantitative information for each product, lot, and (optionally) storage unit 
in a facility.

A subset of document line columns is used for summary lines entry, as shown in 
the following view.

.. image:: _images/lines-1blank.png

The sumary document line entry uses product record default values for most 
values. When received goods require specific information different from 
these defaults, a document line detail view is required. 

Document line detail entry is divided into two sections: descriptive entries, 
and quantities. The following sections of this topic give examples of summary 
line entries, and corresponding detail entries which add to individual lines.

.. note::
   The summary and detail lines which follow use the following conventions:

   *  Yellow -- highlights summary lines which are selected for detail display.
   *  Dark Green -- indicates entries which are pulled from the Product, or 
      which could not be changed in this example. 
   *  When INNER UOM is left blank on a product, INNER quantities will not be 
      enterable on transaction lines.
   *  Dark Gray -- indicates default values which could have been changed if 
      need be, but were not changed in the displayed example.

Unit Weights and Measures
=============================

The classic individual unit entry is roll paper, where accurate unit weights and
measures are required for shipping and billing. Below is an entry lines list, 
where each roll has a unique foot linear measure and a unique net weight.

.. image:: _images/lines-2rolls.png

The details for one line are shown below. Every entry for the roll was
available in the summary line entry, and no changes were made in the detail. 
The roll net weight of 2611 Lbs, entered in the summary list view, is close to 
a default weight of 2616.38 lbs, calculated from the content value of .58 
lbs/ft.

.. image:: _images/lines-2-detail.png

Partial and Mixed Pallets
=============================

When goods are handled pallet-in, pallet-out, tracking mixed pallets may seem 
unnecessary. However, a number of circumstances result in mixed units or 
pallets in every warehouse:

*  Part of a unit may have damage. Damaged and whole goods must be listed with
   separate content lines.
*  If damaged content is replaced with make-up goods from a different lot, then 
   separate content lines are needed to track the two lots.
*  Pallet units may contain lot remainders transferred in from a production 
   line or even from another distribution center.
*  Multiple products may be shipped on mixed pallets to reduce shipping costs. 
   The warehouse may choose to lump the goods and not segregate them if picking 
   from mixed pallets is not problematic.
*  Inconsistent pallets may be received due to storage requirements in previous 
   warehousing. 
*  Stripping a floor-loaded container may result in a hand-full of remainders 
   for multiple products or lots, which get lumped on a mixed pallet.

We talk about not having mixed pallets when actually we do have them. 

By default, webWARES combines unit and content data in a single entry line. In
contrast, mixed pallet units start with a line that omits content values for 
**Product**, **Variety**, or Lot **Control**, but includes **UnitID** which is 
required. 

Subsequent content lines will include **Product**, **Variety**, or Lot 
**Control** values, followed by the **UnitID**. Repeating the **UnitID** 
triggers the association of the mixed content to the master "unit only" primary 
line.

.. tip::
   In addition to sharing **UnitID** and **Location**, mixed unit and content
   lines have the same **LineKey** (see :ref:`cryptic-data`). Every document 
   line has an entry for **LineKey**, while the **UnitID** value is optional on
   lines and is surely missing with bulk entries.

.. image:: _images/lines-3mixed.png

Detail for the highlighted line is shown below. Unit partial weights and partial 
measures are auto-calculated on the content lines, and these values and the 
location are filled and protected. Every entry but one, the **Condition**, came 
from either product default values or the summary line entry.

.. image:: _images/lines-3-detail.png

Unit Tracking
=============================

Where each unit of a truck load is tied to unique information, the units must 
be entered separately in the lines summary. Values which make individual line 
entries necessary include varying **Lot Control** numbers and **Location**, 
individual **Unit ID**, and varying weights or measures per unit. An example 
truck load unit entry is shown in the following figure.

.. image:: _images/lines-4units.png

The details for the highlighted line are displayed to demonstrate the entries 
which commonly change from unit to unit. Each unit in the example has a unique 
**NetWeight**, for example. 

.. image:: _images/lines-4-detail.png

.. tip::
   Sometimes unique values are required for both **NetWeight** and 
   **GrossWeight**, but the program does not store gross weight. Since gross
   weight is by definition greated than net weight, entering gross weight in the 
   unit **TareWeight** field will calculate the **TareWeight** as the difference 
   between the two weights. Then the gross weight can be rederived from the two 
   entries at any time.

Bulk Versus Unit Entry
=============================

Many truck loads consist of 20 or more units, all uniform, to be stored in a 
single bay location and moved load-in load-out. The work of entering each unit
on a line is unnecessary in that case. In the previous example, if the units 
had been uniform, the load could have been entered as a single bulk line as 
shown below.

.. image:: _images/lines-5bulk.png

Using Line Detail Entries
=============================

Line detail entries are necessary when entering unique values which are not 
visible in the summary. Specific cases where this might occur are listed here.

*  Damaged goods must be entered in separate content records which are marked 
   in the details.
*  Marks, variable descriptions, or special lot notes are entered in details.
*  Broken cases or sampled bags should be entered separately, noting the shorted 
   inner quantities.
*  Content count discrepancies on receiving are entered in the **Over/Short** 
   value, as positive or negative numbers.
*  Variable tare weights or gross weights are entered in the details view, 
   unlike consistent tare weights which are entered on the product setup.
*  When unit weight varies, linear counts or volumetric measures probably vary 
   too. This is especially important with hazardous materials, where both 
   weights and volume measures are used on the Bill of Lading.

.. _cryptic-data:

Line Data not Displayed
=============================

Some document line data may not be included in a view, but is required for
program operation. These columns are described in the following list.

*  **SequenceKey** -- Each transaction line is assigned a unique sequential key.

*  **TransactionType** and **Transaction** -- These are required back references
   from the document header, and these columns organize lines in lot or location 
   detail displays.

*  **LineKey** -- is necessary to maintain the original document structure for 
   for shipping and receiving documents. Pick tickets are printed with lines 
   sorted by Location, but Warehouse Receipts and Bills of Lading are sorted in 
   the original document order, that is, by **Linekey**.

   **LineKey** tracks the initial entry sequence of lines in a document:

      `LINEKEY = ( TRANSACTION * 1000 ) + LINEPOS`

   Where units (pallets) with mixed lots are received or shipped, or where 
   fungible order quantities are expanded to be filled by multiple unit picks, 
   several transaction lines with unique **SequenceKey** and varying 
   **Location** entries may have the same **LineKey**.

*  **Status** -- is determined from assigning unit numbers when unit tracking 
   is used, from picking, staging and loading activities, and from releasing 
   completed documents, applying charges, and inviocing.

*  **PostDate** -- is copied from the transaction header and applies to all
   lines in a document. The **Postdate** of a document should be finalized at 
   the date and time that the warehouse signs a receipt or a carrier signs for 
   a shipment.

*  **ContentOnHand**, **InnerOnHand**, **ContentReserve**, **InnerReserve** --
   The user interface shows Content and Inner Quantities, but these quantities 
   are actually represented in the data as either **_Reserve** or **_OnHand** 
   depending on the line status. The appearance of a single data field is 
   deceptive from the standpoint of data definition.

*  **Account** -- is copied from the transaction header for positive-quantity
   lines (receipts and adjustments), and an error is generated when a product 
   record with the Account, Product, and Variety does not exist. Therefore new 
   lots on a document always belong to the master account of the document. 

   Shipments may withdraw only from lots belonging to the document's account.

   Adjustments may withdraw from any lot regardless of the account in the 
   document heading. Therefore adjustments can effect ownership transfers, where 
   negative-quantity adjustment lines deduct from one owner account and positive 
   lines add to the owner account listed in the adjustment header.

*  **UnitUOM**, **ContentUOM**, and **InnerUOM** -- are display-only values 
   copied from the current product record.

Document Lines Column Data
=============================

.. warning::
   **Over/Short** applies to content only, and only on receipt, where content
   is a visually countable quantity (cartons, cases, bags, etc.).

Documentation resources include the data column definitions for :ref:`trlines`.
