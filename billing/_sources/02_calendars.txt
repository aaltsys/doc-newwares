.. _bill-calendar:

#############################
Calculation Calendar 
#############################

WARES performs repeating operations, such as creating lease space charges or 
calculating recurring storage, according to calendar settings. 

Activities which are predefined to use calendars include recurring calculations 
and repeating rates. Each account identifier represents a recurring group, 
and all recurring calculations use service code **1S**. [1]_ Repeating rate 
calendars are identified by the group and service code of the corresponding 
rate record.

A list of active calendars may be displayed according to the service code or 
the group, and a selection of those calendars may be performed. Recurring 
calculations and repeating rates can only be performed through calendars.

Calendar items are activated when their next date comes due, and the action of 
the item is then performed by user request. Consequently calendar items are not 
necessarily performed at a specific date or time. For example, a recurring 
calendar item activated at the end of a month might be pended while inventory 
is reconciled, and then performed some number of days later. 

Calendar items track the last date an action was performed, and set a 
**Next Date** for activating the item. Calendars may be perpetual, or a sunset 
date may be entered when the calendar will expire. 

When a calendar item is performed, the **Last Date** is archived as a 
**Previous Date**, **Next Date** entry is moved to **Last Date**, and a new 
**Next Date** entry is generated. The **Previous Date** entry, not shown in the 
user interface, allows a calendar item's schedule to be reversed (once) when 
the associated action is reversed or voided. 

A calendar entry page with example setting is shown following. 

.. image:: _images/calendar.png

A calendar item contains two types of entries: process control entries, 
described above, and scheduling definition entries. Scheduling is defined by a 
set of three related entry options. 

#. **Repeat** sets the span of the repeating period (see :ref:`repeat-list`),
#. **Options** may modify any values associated with the repeat (see 
   :ref:`option-list`), and
#. **Values** lists specific days or dates for the calendared events (see 
   :ref:`value-list`).

+--------------+---------------+-----------------------------------------------+
| Repeat       | Options       | Values                                        |
+==============+===============+===============================================+
| Daily        | Every, Any,   | DAY                                           |
|              | Current       |                                               |
+--------------+---------------+-----------------------------------------------+
| Weekly       |               | SUN, MON, TUE, WED, THU, FRI, SAT             |
+--------------+---------------+-----------------------------------------------+
| BiWeekly     | First, Second | SUN, MON, TUE, WED, THU, FRI, SAT             |
+--------------+---------------+-----------------------------------------------+
| Monthly      | First, Second,| SUN, MON, TUE, WED, THU, FRI, SAT,            |
|              | Third, Fourth,| FIRST, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, |
|              | Last          | 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,   |
|              |               | 24, 25, 26, 27, 28, 29, 30, LAST              |
+--------------+---------------+-----------------------------------------------+
| Quarterly    | First, Second,| FIRST, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, |
|              | Third         | 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,   |
|              |               | 24, 25, 26, 27, 28, 29, 30, LAST              |
+--------------+---------------+-----------------------------------------------+
| SemiAnnually | First, Second,| FIRST, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, |
|              | Third, Fourth,| 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,   |
|              | Fifth, Sixth  | 24, 25, 26, 27, 28, 29, 30, LAST              |
+--------------+---------------+-----------------------------------------------+
| Yearly       | Jan, Feb, Mar,| FIRST, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, |
|              | Apr, May, Jun,| 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,   |
|              | Jul, Aug, Sep,| 24, 25, 26, 27, 28, 29, 30, LAST              |
|              | Oct, Nov, Dec |                                               |
+--------------+---------------+-----------------------------------------------+

For **Daily** repeats, the options of Every, Any, and Current have the effect:

*  **Every** requires the scheduled item to occur on every day. This would 
   apply to daily recurring, for example,
*  **Any** allows the action to run once for today, but process a range of days 
   from the **Last Date** (plus 1) to today, and
*  **Current** allows the action to run once from **Last Date** (plus 1) to the 
   end of the current open period or to today, which ever comes first. 

.. [1] When **Anniversary** method recurring is used, the account's recurring 
       calculation calendar must preclude having two anniversary dates fall in 
       the same calculation interval. The interval **[Feb 1, Mar 3]** would be 
       invalid, for example, while **[Feb 15, Mar 14]** would be valid.
   
Calendars Database Schema
=============================

Here is a link to the :ref:`calendars-schema` schema.
