.. _adjusting:

#############################
Adjusting Procedures
#############################

Use adjustments to reconcile inventory in the information system with actual 
stock on the warehouse floor. 

Adjustments correct mistakes such as product misidentification or quantities 
which were extended from erroneous lot or unit factors. Also adjustments may be 
required to record customer orders such as product detention or release from 
detention, disposal of damaged goods, and ownership transfers.

.. -image:: _images/document-b2address.png

   :right:

Adjustment Heading Entries
=============================

Adjustment heading information is reduced since there is no transportation or 
additional quantity information. Addresses are reduced to the account and the 
warehouse building, as shown in the image at right.

Adjustment Messages
=============================

WARES requires a note to explain the reason for the adjustment. Several coded 
messages are available as listed in the following table. If none of these 
messages cover the adjustment, choose the default code **ADJ** and enter an 
appropriate note.

+-----+-----------------+----------------------------------------------------+
| ARP | ADJUST PRODUCT  | Correct product received under wrong identifier    |
+-----+-----------------+----------------------------------------------------+
| ARL | ADJUST LOT      | Correct lot received with wrong lot control        |
+-----+-----------------+----------------------------------------------------+
| ARD | ADJUST DESC     | Correct lot received with incorrect description    |
+-----+-----------------+----------------------------------------------------+
| ARF | ADJUST FACTOR   | Correct product received with incorrect factor     |
+-----+-----------------+----------------------------------------------------+
| ARQ | ADJUST QUANTITY | Correct product received with wrong quantity       |
+-----+-----------------+----------------------------------------------------+
| ARU | ADJUST UNIT     | Correct unit received with wrong identifier        |
+-----+-----------------+----------------------------------------------------+
| ARC | ADJUST CONDITION| Add damage or condition to received lot            |
+-----+-----------------+----------------------------------------------------+
| ARX | ADJUST CLEAR    | Clear damage or condition from received lot        |
+-----+-----------------+----------------------------------------------------+
| ADJ | ADJUST GENERAL  |                                                    |
+-----+-----------------+----------------------------------------------------+

Generally adjustment messages are applied as adjustment notes.

.. _owner-transfer:

Ownership Transfers
=============================

Ownership transfers can be entered in two ways: either (1) withdraw goods using 
a shipment, then use a receipt to add goods to a different account, or (2) use 
an adjustment to withdraw goods from one account and add goods to another 
account.  

The first method, using shipments and receipts, is problematic because of 
automatic receiving charge calculations, lot anniversary dates, and consistency 
issues caused by using two documents. 

Method (2) requires understanding special rules of Line Detail entries on 
adjustments. The line detail views allow entering an **Account** on adjustments 
only, and the subsequent quantity of the line must be negative when the account 
does not match the document header. For positive-quantity lines, the **Account** 
is always inherited from the document header and cannot be changed.

The receiving account must own product records for the goods before a transfer 
can be entered in any case, otherwise an error will be generated.
