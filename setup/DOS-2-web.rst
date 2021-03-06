.. Changes from DOSWARES to webWARES

.. _DOS2web:

#############################
Changed from DOS to webWARES
#############################

Account Setup
============================= 

Exceptional accounting functions in DOSWARES are rationalized in webWARES, and 
so setup of these functions has been removed from the Accounts window. These 
are:

*  **Recurring calendar** and the corresponding **Recur Flag** are removed, as
   webWARES incorporates a generic billing calendar feature. Each account in 
   webWARES requires a recurring billing calendar, and the calendar shows LAST 
   and NEXT dates, eliminating the recurring flag. See recurring documentation.
*  **Recurring Minimum** is now implemented through a standard rate record 
   which requires a built-in custom billing method, as documented in recurring
   section.
*  **Value Surcharge** as a percentage of storage rate could be implemnted as a 
   rate record and built-in custom billing method, as documented in ... *(not 
   done yet, and documentation not updated in :ref:`07_accounts`)*. The better 
   implementation is simply to set the account's storage rates to reflect the 
   increased rates.

Recurring Audits
=============================

Recurring auditing in webWARES is significantly different than in DOSWARES. To 
simplify the generation of reports, a single recurring audit report documents
the billing quantity of the recurring (or deferred receiving) quantities. Now 
the audit tracks only the quantity being billed, as one of the following:
Units, Packages, Inners, Net Weight, Gross Weight, or Volume/DIM.
