.. _users:

#############################
Setup Program Users
#############################

Configure program Users here, specifying their logins and their corresponding 
program access. Users may be restricted to viewing information for specific 
customer accounts, or to performing specific functions, depending on their role.

There are several roles for users which determine program access privileges, as 
shown following. 

+------------+------------------------------------------+----------------------+
| Role       | Description                              | Access               |
+============+==========================================+======================+
| Account    | View account, enter unposted documents   | 0 entry, 1+ view     |
+------------+------------------------------------------+----------------------+
| Clerical   | Enter and post documents                 | 1-2 entry, 3+ view   |
+------------+------------------------------------------+----------------------+
| Operations | Enter, post, and update documents        | 1-2-3 entry, 4+ view |
+------------+------------------------------------------+----------------------+
| Billing    | Update, calculate and invoice documents  | 1-4 update, 5 view   |
+------------+------------------------------------------+----------------------+
| Admin      | Update, calculate, void, maintain system | All system functions |
+------------+------------------------------------------+----------------------+

Program features and their corresponding access requirements are listed 
following, to show what each role may do. Roles may permit a user to **view**
only, to **enter** new records (with restrictions), or to enter or **change** 
any information which is viewed.

+----------------------+----------+-----------+-----------+----------+---------+
| Feature              | Account  | Clerical  | Operations| Billing  | Admin   |
+======================+==========+===========+===========+==========+=========+
| Company Setup        |          |           |           | view     | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Company / Facility   |          | view      | view      | view     | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Facility / Locations |          | view      | change    | change   | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Company / Users      |          |           |           |          | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Company / Rate Codes |          |           | view      | change   | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Accounts Mangement   |          | view      | view      | change   | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Accounts / Rates     |          |           | view      | change   | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Contacts Setup       |          | change    | change    | change   | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Products Setup       | view     | change    | change    | change   | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Inventory            | view     | view      | change    | change   | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| Orders               | enter    | change    | change    | change   | change  |
+----------------------+----------+-----------+-----------+----------+---------+
| ...                  | ...      | ...       | ...       | ...      | ...     |
+----------------------+----------+-----------+-----------+----------+---------+
 
