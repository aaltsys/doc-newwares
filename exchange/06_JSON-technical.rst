.. _JSON-technical:

#############################
JSON Exchange Technical Info
#############################

WARES Uses Short Filenames
=============================

Windows has two file naming conventions: upper-cased 8-character short names, 
and 256-character case-sensitive long names. File operations may be performed 
using either the short name or the long name, as directory entries track both 
names. Using short names, when a file operation results in a name collosion, 
new files may overwrite previous files, resulting in data loss.

WARES performs file operations using 8-character short filenames. This is not 
a problem when using local files with distinct long names, because Windows 10
creates unique short names, as shown here::

   Directory of W:\ATLAS\IMPORT\ORDERS\HISTORY

   09/20/2017  03:55 PM    <DIR>                       .
   09/20/2017  03:55 PM    <DIR>                       ..
   09/20/2017  03:55 PM             1,149 3SUZMY~X.JSN 30000000223.JSN
   09/20/2017  03:55 PM               889              14915.JSN
   09/20/2017  03:55 PM               829 3927GZ~4.JSN 30000000104.JSN
   09/20/2017  03:55 PM               844              14921.JSN
   09/20/2017  03:55 PM             1,329 1MUCJR~M.JSN 30000000022.JSN
                  5 File(s)          5,000 bytes

Files linked to a Dropbox share use a different protocol for generating short 
filenames. The first 6 digits of the filename are followed by a tilde (~) and
then a single digit from 1 to 9. Sequenced filenames longer than 8 characters 
will have short name collisions, and WARES file operations on the short names 
will result in data loss. This is illustrated with the directory listing below, 
where the same file list has been run through Dropbox::

   Directory of C:\DROPBOX\SHARED\ORDERS\HISTORY

   09/21/2017  11:03 AM    <DIR>                       .
   09/21/2017  11:03 AM    <DIR>                       ..
   09/21/2017  11:03 AM             1,149 300000~1.JSN 30000000223.JSN
   09/21/2017  11:03 AM               889              14915.JSN
   09/21/2017  11:03 AM               829 300000~2.JSN 30000000104.JSN
   09/21/2017  11:03 AM               844              14921.JSN
   09/21/2017  11:03 AM             1,329 300000~3.JSN 30000000022.JSN
                  5 File(s)          5,000 bytes

.. warning::
   During file exchange, WARES requires unique filenames of 8 or fewer 
   characters to guarantee that data will not be lost.

WARES Stores Paths to Shares
=============================

For operational simplicity and reliability, WARES automates exchange processes 
by saving absolute file paths to directories on network shares. Dropbox cannot 
synchronize files mapped to network shares reliably; it can only synchronize 
with local file folders.

This presents some issues. First, multiuser WARES runs entirely from a network 
share. Second, Dropbox installs itself on the local user's directory path, and 
this path is different for every user. Third, Dropbox needs directories to be 
linked from the local user's system to the mounted Dropbox folders.


