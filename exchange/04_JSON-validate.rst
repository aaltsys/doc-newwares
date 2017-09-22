.. _JSON-validate:

#############################
JSON Exchange Validation
#############################

JSON specifies a way to encode data objects for web services, particularly when 
used with JavaScript. JSON does not describe a way to stream a set of data 
objects or to perform reliable data exchange, as such protocols are external to 
JSON's purpose. 

This article details the WARES components and methods which implement reliable 
data exchange with JSON structured document files.

Directory Sharing
=============================

Directory sharing services are the Internet's answer for data transfer between 
partners. These services replace EDI's proprietary Value-Added Networks (VANs), 
dial-up storage systems, FTP sites, and email attachments. 
`DropBox <https://www.dropbox.com/help/files-folders>`_ provides a shared file 
system which, when mounted, appears as a native directory structure on any 
computer or server using an Apple, Linux, or Microsoft operating system.

When a directory is shared for data exchange, within the directory should be 
a folder for each document type to be exchanged, and corresponding sub-folders 
to archive files which have been picked up. To exchange warehouse orders, for 
example, there would be an *ORDERS* folder, an *ORDERS/HISTORY* sub-folder, an 
*ORDERS/STREAMS* sub-folder, a *SHIPPERS* folder, and a *SHIPPERS/HISTORY* 
sub-folder, as shown in :ref:`JSON-integrate-view`.

DropBox uses file system extensions to make the exchange fileshare appear as a 
part of the local file system. This allows WARES to perform file operations 
directly on the shared files during JSON import, unlike using FTP sites or EDI 
VANs which require a separate communications program for file exchange. 

Transaction Numbering
=============================

Traditional EDI uses sequential counters to track documents, groups, and 
exchanges. The WARES implementation of EDI maintains a perpetual document 
history, and if a document number of a specific type is received twice, the 
second receipt is detected as a duplicate by the EDI software. By comparison, 
JSON does not have streaming protocols to which the concept of sequenced 
transmission documents would apply.

.. note::
   The EDI numbering model is applied externally to the exchanged documents, so 
   the retransmission of an exchange is detected this way but a duplication due 
   to resubmitting a document, which produces a new sequence number, is not. 

Detecting Duplicate Documents
=============================

When WARES imports an order, combinations of the internal consignee identifier 
and the document reference numbers are indexed to look for duplications. When 
a reference number is repeated the order is marked as a duplicate, and a human 
operator must resolve this conflict. This methodology detects duplications 
whether a file is retransmitted or a document is resubmitted. (Order Status 0 
is used to indicate orders received with errors, including order duplicates.)

Using JSON, when a warehouse client writes individual order documents into a 
file share using a reference number as the filename, resubmitting an order will 
just replace the file -- up to the point when the warehouse picks up the files. 
There is no such thing as a "transmission duplication," and WARES duplicate 
detection catches resubmissions that occur once an original order is streamed. 

.. warning::
   This process has a consequence: if a JSON order is shipped from the 
   warehouse, and then it is resubmitted by the client, the resubmitted order 
   will overwrite the original in the fileshare history.

.. note::
   EDI transaction numbering is sequential, so that it is possible to detect a 
   missing or faulty document by number and request resubmission automatically. 
   No one does this actually, as automatic resubmission of failed documents 
   would be pointless when a document is faulty to begin with.

Batch Numbering
=============================

WARES processes streams, not individual order files. When WARES selects a group 
of JSON orders for processing, the group is compiled into a stream file and 
written to a file processing stream history, separate from the exchange share. 
The stream filename is a datetime stamp of when the files were selected.  

.. note::
   Stream files are never overwritten by the client, so resubmitting a document 
   after it has been processed saves the original and its resubmission in 
   separate streams, and no information is lost in stream history. 

Document Counts and Lengths
=============================

Measuring the reliability of document exchange is an issue.

EDI transmission standards include counts of groups and document counts within 
groups. Further, the footer of each document has a count of the included data 
segments. Nothing in JSON or any other structured data presentation corresponds 
to the EDI concept of data segments. Similarly, character counts which are used 
in transmission are not a reliable measure of structured textual content in 
either EDI or JSON, as reformatting can either add or eliminate white space. 

So, we are left with counting documents while processing. WARES does this quite 
well, reporting the number of processed documents at the end of import or 
export. This should be compared with the number of records written to the WARES 
Orders file for example, and to the directory of documents which were processed
and moved to the ORDERS/HISTORY fileshare. To this end, WARES writes both the 
stream file and a directory listing of processed document files to the 
ORDERS/STREAMS folder. The directory listing has file extension ".ls", while 
".JSN" is the stream extension.

Document Acknowledgments
=============================

EDI specifies the form of Acknowledgments (set 997) which may return counts for 
documents accepted without errors, accepted with errors, and rejected. Classic 
EDI is a standalone application, and so documents are checked for syntactical 
compliance with standards, but semantic implications of documents cannot be 
reviewed. A document which is accepted without errors may contain entirely 
useless information, as for instance ordering products which are not a part of 
inventory, or requesting an expired delivery date.

Because JSON exchange includes importing actual documents, it may be possible 
to add semantic checks as part of acknowledgment, as is mentioned previously 
with duplicate detection. However, such semantic checks will likely be limited 
to comparing values to datatype and formatting specifications, which is just 
what EDI does.

THE NATURE OF SUCH JSON ACKNOWLEDGMENTS IS YET TO BE DETERMINED.

Stream DateTime Decoding
=============================

WARES limits stream filenames to no more than eight characters. An encoding 
scheme is employed to include date and time information in this name, and to 
arrange streams in chronological order when sorting (left-aligned). Following 
is the decoding to determine date and time of a stream from its filename.

Year, Month, Day, and Seconds since midnight are presented in 8 characters:
**YYMDDTTT**.

*  **YY** Year: Add century digits **20** in front of the year to complete the 
   year.
*  **M** Month: Letters [A,B,C,D,E,F,G,H,I,J,K,L] represent consecutive months 
   January through December.
*  **DD** Day: The day of month is displayed in two right-aligned, zero-filled 
   digits.
*  **TTT** Time: 36 symbols: [0,1,...,9,A,B,...,Z] are used to encode time in 
   base 36. Convert from base 36 to base 10 and then multiply by 3 to get the 
   time in seconds after midnight.
   
.. note::
   The five-character date portion of stream names will always sort correctly. 
   The chronology of times within a date may be out of sequence if the 
   operating system encodes letters before numbers in character sequence.

Exchange Validation TLDR;
=============================

JSON exchange through file sharing bypasses the concept of data transmission, 
so there is no sequence numbering for transmissions as in EDI. Similarly each 
document type being exchanged uses a different folder in the fileshare, 
replacing the EDI concept of document groups. Also, documents are placed into 
streams by the recipient, not the sender, so group sequence numbering is 
replaced by process timestamps on stream files. Reference numbers extracted 
from document data are used as filenames for individual documents, replacing 
document transmission sequence numbers. 

File sharing allows programs to manipulate exchanged datafiles directly, which 
eliminates unreliable interplays between programming and system functions. 
Each recipient is responsible for reporting documents received and processed to 
the sender, so that the sender can verify the success of data exchange. All 
data are available for review, providing transparency in exchange. The customer 
can guarantee the confidentiality and security of data by owning the DropBox 
session used for data exchange.

