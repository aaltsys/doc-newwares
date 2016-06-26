.. _billoflading:

#############################
Bills of Lading
#############################

A Bill of Lading document represents a contract between a shipper and a carrier
for transportation from an origination point (Ship From) to a destination (Ship 
To), with delivery to a specific party, the consignee. [1]_

While legal terminology and contractual text is common to all B/L documents, 
shippers and carriers create customized Bill of Lading document formats to meet 
their specific needs. WARES provides a 3PL Bill of Lading document format which 
addresses specific concerns:

*  It avoids having bills sent to the warehouse instead of the named shipper.
   the Freight Billing address is clearly stated on every Bill of Lading.
*  Columns are ordered to match DOT guidelines: Units, HM, Description, Weights 
   or Quantities. (The GS1 standard form mis-orders columns.)
*  Entries are designed to eliminate hand marking when using automated 
   labor activity management.
*  Description is intended to include Product, Lot Number, and Unit number 
   entries in addition to the basic commodity name.

A blank WARES Bill of Lading may be viewed here: :ref:`bill-of-lading`.

Mandatory Elements
=============================

*  Ship From: name, address and zip code
*  Ship To: name, address and zip code
*  Bill of Lading Number
*  Carrier Name and SCAC
*  Freight Payment Terms
*  Handling Unit Quantity & Type UOM
*  Packages Quantity & Type UOM
*  Commodity Description
*  Net Weight of line item
*  Loaded by and Counted by Descriptors
*  Shipper and Carrier Signatures

Conditional Information
=============================

*  BILL TO: if different from shipper, the name, address and zip code
*  PRO NUMBER: for an LTL shipment
*  TRAILER NUMBER: for a truckload shipment
*  SEAL NUMBER: if sealed from one origin to one destination
*  MASTER BOL INDICATOR: if underlying BOLs are attached
*  SPECIAL INSTRUCTIONS: on a Master Bill of Lading, a list of included B/Ls
*  CONSIGNEE REFERENCE NUMBER: used when shipping to a purchase order
*  PACKAGE QUANTITY AND TYPE: if shipment is unitized
*  HAZARDOUS MATERIAL INDICATOR: if commodity is defined as hazardous
*  NMFC NUMBER AND CLASS: if an LTL shipment
*  RECEIVING STAMP: if a truckload shipment

Document Reference Codes
=============================

Per GS1 standards, these elements should be printed in 12-point bold text. [2]_

Bill of Lading Number
-----------------------------

The Bill of Lading number should be either the WARES-generated shipment number, 
for a WARES B/L, or the shipper-supplied GS1 US standard Bill of Lading Number. 
When using the shipper's B/L numbering, the WARES shipment number should appear 
as the shipper reference number.

The GS1 number is comprised of the shipper's unique document sequence number 
**S**, up to 9 digits long, right aligned at sixteen characters and zero-masked. 
This value of **S** is overstruck with the shipper's U.P.C. Company Prefix **C** 
(7 to 13 digits) left aligned, or the digits **04** should be used when a 
shipper lacks a U.P.C. prefix. _[#] A seventeenth check digit is calculated as:

   CD = 9 - MOD( C/S*(1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3)-1, 10 )

Ship to Location Number
-----------------------------

Customer Order Number
-----------------------------
   
Standard Carrier Alpha Code
-----------------------------

The SCAC is an alpha of up to 4 characters, left aligned, and masked with 
hyphens ( **-** ). [3]_

Carrier Progressive Numbers
-----------------------------

For LTL shipments, Carriers supply PRO numbers of up to 20 alpha-numeric 
characters. The carrier should provide this number with check digits included, 
as there is no standard algorithm for calculating PRO number check digits.

Application Identifiers
-----------------------------

Bar code labels for the Bill of Lading and SCACPRO entries should be encoded 
using the GS1-128 barcode format. Each code starts with a corresponding 
Application Identifier (AI): the Bill of Lading AI is **402**, and the SCACPRO 
AI is **9012K**. Text displaying the barcode data shows the AI enclosed in
parentheses. (PRO labels applied by the carrier to a Bill of Lading might not
use this convention.)

Declarations and Legal Terms
=============================

Paragraph terms are printed in 5-point or larger text. (WARES uses 8-point 
type on its Bill of Lading statements.)

Declared value Statement
-----------------------------

   Where the rate is dependent on value, shippers are required to state 
   specifically in writing the agreed or declared value of the property as 
   follows: "The agreed or declared value of the property is specifically 
   stated by the shipper to be not exceeding  ___________ per   __________."

Received legal statement
-----------------------------

The following statement should appear above the Carrier's Signature. (Alternate 
statements may be used where Bills of Lading differentiate between LTL and TL 
shipemnts, or where a party to the shipment participates in the NMFC.)

   RECEIVED, subject to individually determined rates or contracts that have 
   been agreed upon in writing between the carrier and shipper, if applicable, 
   otherwise to the rates, classifications and rules that have been established 
   by the carrier and are available to the shipper, on request; and to all 
   applicable state and federal regulations.

Non-recourse Signature
-----------------------------

By signing the non-recourse statement (formerly known as Section 7) the shipper 
is protected from responsibility for freight charges. This signature may be 
pre-printed on custom versions of the Bill of Lading form.

   The carrier shall not make delivery of this shipment without payment of 
   freight and all other lawful charges.  Shipper signature ___________________

Shipper Signature Block
-----------------------------

   This is to certify that the above named materials are properly classified, 
   packaged, marked and labeled, and are in proper condition for transportation 
   according to the applicable regulations of the DOT.

Carrier Signature Block
-----------------------------

   Carrier acknowledges receipt of packages and required placards. Carrier 
   certifies emergency response information was made available and/or carrier 
   has the DOT emergency response guidebook or equivalent documentation in the 
   vehicle. Property described above is received in good order, excedpt as 
   noted.

Standardized Bills of Lading
=============================

To facilitate commerce, a consortium of merchant groups promulgated the 
"Voluntary Inter-Industry Commerce Standards," or VICS, Bill of Lading. Many 
retailers demand this form, making the VICS B/L less than voluntary. VICS is 
now managed by the global information standards organization GS1.

Particularly with regard to third-party logistics, there are objections 
to using the VICS / GS1 Bill of Lading and associated efforts regarding EDI:

(a) The VICS format conveys purchase order fulfillment information, which 
    exceeds the B/L scope of a contract between shipper and carrier. 
(b) VICS forces participating shippers to purchase proprietary registered 
    sequence numbers, and to maintain B/L number assignments across originating 
    points including third-party logistics (3PL) providers over which they have 
    no control.
(c) Shippers may not share original purchase order numbers and quantities with 
    their 3PL vendors, but this information is expected on the VICS B/L.
(d) A typical 3PL Bill of Lading would contain 4 addresses: Ship From, For the 
    Account Of, Ship To, and Bill Freight Charges To. When is Shipping From a 
    3PL warehouse, the Account address is the actual shipper. The VICS B/L 
    format does not provide for 3PL shipment addressing.
(e) Associated Electronic Data Exchange (EDI) requirements, such as the ASN, 
    are similarly deficient in that document origination from a 3PL is not 
    practical.
(f) The VICS B/L form was specified by persons unfamiliar with layout design 
    for automated data entry and labor activity. Numerous "circle one," "check 
    here," and "stamp" and "label" areas within the document body result in 
    documents which can only be stored and transmitted as scanned immages, 
    rather than data structures.

Implementation of VICS / GS1 standards is burdensome for shippers, unhelpful to 
carriers, and problematic for 3PL providers. As a result, shippers and carriers 
use their custom B/L formats when originating documents unless the GS1 form is 
required by the consignee. WARES offers a custom B/L document just as everyone 
else does, although this form closely follows GS1 recommendations.

-----

.. rubric:: Footnotes

.. [1] A summary of legal requirements for a Bill of Lading is found at
       https://www.fmcsa.dot.gov/regulations/title49/section/375.505.

.. [2] A GS1 company identifier is obtained (for a fee) from GS1 US, Inc. at:
       https://www.gs1us.org/application-for-barcodes-authorized-by-gs1-us.
     
.. [3] Carriers may obtain a SCAC code (for a fee) from the NMFTA at:
       https://secure.nmfta.org/Welcome.aspx

.. [4] A DOT guide for preparing shipping documents for hazardous materials is at: 
       http://www.phmsa.dot.gov/pv_obj_cache/pv_obj_id_F5CCAF5DDA6ABEB6C9C3F6F83684445D6CEF2700/filename/shipping_papers_guide.pdf
