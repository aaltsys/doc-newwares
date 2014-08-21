.. _posting:

#############################
Transaction Posting
#############################

Transaction lines post to the locator based on a post-write database trigger.
Each transaction line refers to a single locator entry. The post process 
collects all lines associated with a locator entry, and then adds the signed 
quantities to determine total locator entry quantities. 

INBOUND:
=============================
   
   *  Choice of entering from order, or from ASN
   *  Unit lines added to locator on status INBOUND
   *  Units can be RESERVED, cannot be allocated
   *  Order required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = EXPECTED
      |  DATETIME
      |  STATUS_CODE = INBOUND
      |  PRODUCT
      |  WEIGHTS & MEASURES  (multiple entries)
      |  CONTENTS (multiple entries)
   
   *  ASN required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = EXPECTED
      |  DATETIME
      |  STATUS_CODE = INBOUND
      |  PRODUCT
      |  UNIT_IDENTIFIER
      |  CONTROL_CODE
      |  CONTROL_LOT
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)

RECEIPT:
=============================

   *  Choice of completing an order, an ASN, or entering from scratch
   *  Unit lines updated or added to locator on status AVAILABLE, HELD, DAMAGED
   *  DOCUMENT array updated to have INBOUND and RECEIPT
   *  Receipt required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = RECEIVED
      |  DATETIME
      |  STATUS_CODE = AVAILABLE, HELD, DAMAGED
      |  PRODUCT
      |  UNIT_IDENTIFIER
      |  CONTROL_CODE
      |  CONTROL_LOT
      |  LOCATION
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
   .. note: 
      An INBOUND unit could be reserved, but upon receipt the unit might be 
      HELD or DAMAGED. A rebalance routine might not have enough inventory 
      afterwards to account for the RESERVE.
   
OUTBOUND:
=============================

   *  Entered, received as Warehouse Order (940), or JSON import
   *  Lines added to locator as RESERVED, deducting from AVAILABLE
   *  Order required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = RESERVED
      |  DATETIME
      |  STATUS_CODE = RESERVED
      |  PRODUCT
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
SHIPMENT:
=============================

   *  Choice of completing an outbound order, or entering from scratch
   *  AVAILABLE (scratch entry) or RESERVED (outbound completion) lines updated 
      to ALLOCATED
   *  DOCUMENT array updated to have OUTBOUND and SHIPMENT
   *  Shipment required information:
   
      |  LINE_KEY
      |  DOCUMENT
      |  DATE_CODE = SHIPPED
      |  DATETIME
      |  STATUS_CODE = SHIPPED
      |  PRODUCT
      |  UNIT_IDENTIFIER
      |  CONTROL_CODE
      |  CONTROL_LOT
      |  LOCATION
      |  WEIGHTS & MEASURES (multiple entries)
      |  CONTENTS (multiple entries)
   
ADJUSTMENT: 
=============================
