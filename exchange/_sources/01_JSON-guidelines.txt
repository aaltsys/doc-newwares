.. _JSON-guidelines:

#############################
JSON Formatting Guidelines
#############################

The following general guidelines for preparing JSON documents is not intended 
to replace a proper JSON specification. Documentation of JSON specifications is 
available at http://www.json.org/, but this guide and a few examples of files 
which meet JSON specifications may be adequate for instruction in developing 
JSON data exchange files.

Basic JSON Formatting Rules
=============================

#. JSON ignores indentation and white-space during interpretation. WARES 
   JSON exports include programming style indentation for clarity.
#. Each complete JSON transmission is enclosed in brackets, and repeated 
   structures within a JSON message are enclosed in brackets ([]).
#. Each data element is named with a preceding identifier label enclosed in
   quotes ("") and terminated with a colon (:). 
#. Successive data elements are separated by commas (,).
#. The order of elements in a JSON structure is not important, as all elements 
   are labeled.
#. Where multiple data elements are grouped into a data structure, the 
   structure grouping is enclosed in braces ({}).
#. Where a data structure may be repeated, the set of repeated structures is 
   given a label and the set is enclosed in brackets ([]).
#. *null* values: JSON does not permit labels associated with blank elements. 
   Either omit the label and element, or provide a *null* value.
#. Control characters such as new lines (\\n) may be included in the data 
   stream as escape sequences. Each escape code must be preceded by an 
   additional escape indicator, the "\\". See the Escape Sequences table below.
#. Each string element is enclosed in quotes (""). Use an escape sequence (\\") 
   to include a quote within the element text.
#. JSON numeric elements are not quoted. Where a decimal point is used in a 
   number, digits (or zero) must occur to the left and right of the decimal.
#. JSON date strings conform to `ISO8601 <http://www.w3.org/TR/NOTE-datetime>`_. 
   The general ISO datetime specification is:

      YYYY-MM-DDThh:mmTZD

   but the time (hh:mm) and the time zone designator (D) would be omitted when 
   sending only a date as a quoted string: 

      "2017-05-22TZ"

Escape Sequences
=============================

Following is a reference list of standard escape sequences used to embed 
special characters or control codes within text strings. While these sequences 
are valid within JSON data strings, only a few will be meaningful in the 
context of data exchange.

+-------------+----------------------------------+-----------------------------+
| Sequence    | Description                      | Representation              |
+=============+==================================+=============================+
| \\'         | single quote                     | byte 0x27 in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\"         | double quote                     | byte 0x22 in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\?         | question mark                    | byte 0x3f in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\\         | backslash                        | byte 0x5c in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\a         | audible bell                     | byte 0x07 in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\b         | backspace                        | byte 0x08 in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\f         | form feed - new page             | byte 0x0c in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\n         | line feed - new line             | byte 0x0a in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\r         | carriage return                  | byte 0x0d in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\t         | horizontal tab                   | byte 0x09 in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\v         | vertical tab                     | byte 0x0b in ASCII encoding |
+-------------+----------------------------------+-----------------------------+
| \\nnn       | arbitrary octal value            | byte nnn                    |
+-------------+----------------------------------+-----------------------------+
| \\xnn       | arbitrary hexadecimal value      | byte nn                     |
+-------------+----------------------------------+-----------------------------+
| \\unnnn     || universal character name        |                             |
|             || (arbitrary Unicode value);      |                             |
|             || may result in several characters| code point U+nnnn           |
+-------------+----------------------------------+-----------------------------+
| \\Unnnnnnnn || universal character name        |                             |
|             || (arbitrary Unicode value);      |                             |
|             || may result in several characters| code point U+nnnnnnnn       |
+-------------+----------------------------------+-----------------------------+

.. _JSON-order:

Sample JSON Exchange File
=============================

The following JSON example is a warehouse order record. The entire transmission 
is enclosed in brackets ([]), and then the individual order record is enclosed 
in braces ({}) because a transmission may contain multiple orders. 

Similarly, **notes** and **addresses** sections are enclosed in brackets, as 
multiple notes or addresses structures might occur in the record. Within the 
address, the street is multi-line text and the newline is represented by the 
escaped newline escape sequence (\\\\n).

Note that numeric order quantities are not quoted, and the integer quantities 
do not include decimal points. Dates are quoted and terminated with "TZ".

.. code-block:: JSON

  [

    {
      "postDate": "2003-01-12TZ",
      "account": "BMC",
      "references": [
        {
          "referenceCode": "6A",
          "reference": "6733"
        },
        {
          "referenceCode": "CO",
          "poNumber": "6852"
        }
      ],
      "carrier": "SUXP",
      "freightPay": "PP",
      "dateCodes": [
        {
          "dateCode": "10",
          "dateShip": "2002-01-15TZ"
        },
        {
          "dateCode": "02",
          "dateDeliver": "2002-01-17TZ"
        },
        {
          "dateCode": "01",
          "dateCancel": "2002-01-21TZ"
        }
      ],
      "notes": [ 
        {
          "noteCode": "WHI",
          "instructions": null
        }
      ],
      "addresses": [
        {
          "addressType": "ST",
          "addressKey": "10017",
          "addressName": "Pitch Pipes Refinery, Inc.",
          "addressStreet": "5270 Industrial Boulevard\\nSuite 401",
          "addressCity": "Lubbock",
          "addressState": "TX",
          "addressZip": "79411",
          "addressPhone": "8065554411"
        }
      ],
      "detail": [
        {
          "lineKey": "001",
          "stockNumber": "BMC001",
          "description": "21x13x08 single white KDC",
          "orderUom": "BD",
          "orderQty": 2
        },
        {
          "lineKey": "002",
          "stockNumber": "BMC002",
          "description": "14x12x21 single brown KDC",
          "orderUom": "BD",
          "orderQty": 3
        },
        {
          "lineKey": "003",
          "stockNumber": "BMC003",
          "description": "18x16x24 double brown KDC",
          "orderUom": "BD",
          "orderQty": 4
        }
      ]
    }

  ]
