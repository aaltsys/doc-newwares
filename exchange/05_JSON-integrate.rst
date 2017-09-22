.. _JSON-integrate:

#############################
JSON Exchange Integration
#############################

Update Windows Workstations
=============================

Although WARES runs entirely from a server fileshare, using Dropbox for file 
exchange will require administrative changes for each computer or user who will 
perform a Dropbox exchange.

Mount Dropbox in User Space
-----------------------------

For every user requiring access to a Dropbox share, follow this link to the `Dropbox installer <https://www.dropbox.com/install>`_ to add Dropbox to their 
user path.

.. _JSON-integrate-view:

View or Setup JSON Share
-----------------------------

Open Windows File Explorer to view the contents of your Dropbox directory. 
Identify the JSON share {foldername} which will be used for JSON orders 
exchange. Verify the contents of this folder. The following directory tree is 
required::

 ┌────────────────────────────────────────────────────────────────────────────┐
 │                          ┌────────────┐                    ┌────────────┐  │
 │                        ┌─┤  Folder 1  │                  ┌─┤  HISTORY   │  │
 │                        │ └────────────┘   ┌────────────┐ │ └────────────┘  │
 │                        │     . . .      ┌─┤  ORDERS    ├─┤ ┌────────────┐  │
 │                        │ ┌────────────┐ │ └────────────┘ └─┤  STREAMS   │  │
 │ User\\Name\\Dropbox\\ ─┼─┤ JSON share ├─┤                  └────────────┘  │
 │                        │ └────────────┘ │ ┌────────────┐   ┌────────────┐  │
 │                        │     . . .      └─┤  SHIPPERS  ├───┤  HISTORY   │  │
 │                        │ ┌────────────┐   └────────────┘   └────────────┘  │
 │                        └─┤  Folder n  │                                    │
 │                          └────────────┘                                    │
 └────────────────────────────────────────────────────────────────────────────┘

.. note::
   You can move a folder tree from your local drive to Dropbox using File 
   Explorer. Right-drag the folder to Dropbox and select "Move here" to create 
   the share. Then setup sharing in Dropbox to configure the folder, or, you 
   could use the following command::
   
      move "C:\\path\\to\\folder" "%userprofile%\\Dropbox"

Commands to Link a Folder
-----------------------------

Search for :command:`CMD.EXE` on your start menu, and right-click to select 
"Run as Administrator." In the DOS command window, type the following commands 
to set a permanent link to a shared Dropbox folder: [#]_ ::

   mkdir C:\Dropbox
   mklink /J "C:\\Dropbox\\{JSONshare}" "%userprofile%\\Dropbox\\{JSONshare}"
   dir C:\Dropbox\\{JSONshare}

.. note::
   The :command:`mklink` command works with WINDOWS Vista and higher, and 
   Windows must have been installed using file system NTFS. Links may also be 
   created with the command::

      fsutil hardlink create "C:\\Dropbox\\{JSONshare}" "%userprofile%\\Dropbox\\{JSONshare}"

   If you are using WindowsXP it is probably time for an upgrade. Call for 
   advice on Windows upgrades.

Add JSON Import to WARES
=============================

Add JSON Import Features
-----------------------------



Configure WARES Pathnames
-----------------------------

WARES saves import and export configuration data in control records. Use menu 
selections :menuselection:`eXchange --> Export-Import --> Exports` and 
:menuselection:`eXchange --> Export-Import --> JSON Imports` to access control 
records and change path settings.

+--------------+--------------------+------------------------------------------+
| Control Name | Entry Label        | Entry values to check                    |
|==============+====================+==========================================+
|| JSONIMPORT  || Export FileName   || null                                    |
|| ORDERS      || Export Directory  || C:\\DROPBOX\\{share}\\ORDERS\\          |
||             || History Directory || C:\\DROPBOX\\{share}\\ORDERS\\HISTORY\\ |
+--------------+--------------------+------------------------------------------+
|| EXPORT      || Export FileName   || {PO_NUMBER}                             |
|| JSONSHIPPERS|| Export Directory  || C:\\DROPBOX\\{share}\\SHIPPERS\\        |
||             || History Directory || null                                    |
+--------------+--------------------+------------------------------------------+

The control names given above are generic; actual control record names will be 
different and unique for each account. Replace {share} with an account ID and
append the account identifier to the control name to generate these controls. 
For example, account-specific controls for account **ABC** might be 
**JSONIMPORT\*ORDERS_ABC** and **EXPORT\*JSONSHIPPERS_ABC**.

.. tip::
   Menu selection :menuselection:`Tools --> Define --> Controls` may be used to edit import controls (and any other controls) just as selections on the 
   :menuselection:`eXchange --> Export-Import` menu are used.

Add WARES Process Selections
-----------------------------

JSON orders import includes new processes **JSONIMPORT_ORDERS** and 
**EXPORT_JSONSHIPPERS** to import orders and create response documents. Custom versions of these processes are needed for each participating account. Use menu item :menuselection:`Tools --> Processes --> Processes Setup` to create the new
processes, as described here:

*  Display the :guilabel:`Processes` window from the menu.
*  Retrieve the first process, **JSONIMPORT_ORDERS**, then rename the process 
   by appending the account ID: for example, **JSONIMPORT_ORDERS_ABC**. Press 
   :kbd:`<return>` to start the new record.
*  Press :kbd:`<Alt-C>, <return>` to copy the last-displayed record into the 
   new record.
*  Change the :guilabel:`Execution` command to use the control name from the 
   previous section; that is, **ORDERS_ABC** instead of **ORDERS**. Change the 
   process title to reflect the customer account, as you will see this title in 
   the selection options.
*  Save the process.
*  Repeat the previous steps for process **JSON*EXPORTSHIPPERS**, where the 
   control name might be **JSONSHIPPERS_ABC** instead of just **JSONSHIPPERS**.

The options list at :menuselection:`eXchange --> Export-Import --> Processes` 
should be used to list these account-specific process choices, as follows:

*  At menu item :menuselection:`Tools --> Define --> Popups`, enter 
   :guilabel:`File name` **POPUPS** and :guilabel:`Popup name` **ECOM_PROCESS**
   to display the exchange processes list. 
*  Add process names created above to the process list, and save the changes.

-----

.. rubric:: footnotes

.. [#] https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/
