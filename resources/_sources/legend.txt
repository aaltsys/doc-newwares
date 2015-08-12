.. _legend:

#############################
LEGEND:
#############################

+------------+----------------------------------------------+
| REQ        || O = optional                                |
|            || M = mandatory                               |
|            || P = pair required                           |
|            || C = conditional                             |
+------------+----------------------------------------------+
| SM         || S = single valued                           |
|            || M = multiple values                         |
|            || A = associated (array member)               |
+------------+----------------------------------------------+
| COLUMN NAME| (not case specific)                          |
+------------+----------------------------------------------+
| TYPE       || A = alpha                                   |
|            || N.n = numeric with decimals                 |
|            || B = boolean                                 |
|            || D = datetime                                |
|            || U = UUID                                    |
|            || LC = list of codes                          |
|            || SK = key sequence                           |
|            || S = sequence                                |
+------------+----------------------------------------------+
| U          | Key values and codes are uppercase           |
+------------+----------------------------------------------+
| VALIDATE   || links refer to code validation lists        |
|            || Tablenames (uppercase) refer to verifiles   |
|            || ('values') list allowed entries             |
+------------+----------------------------------------------+
| DEFAULT    | a value default                              |
+------------+----------------------------------------------+
| JUST       || Justify (L)eft, (C)enter, (R)ight, (T)ext   |
|            || n = characters to show                      |
+------------+----------------------------------------------+
