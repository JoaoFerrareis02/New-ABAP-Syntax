*&---------------------------------------------------------------------*
*& Report z_conversion_operator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_conversion_operator.

DATA cust_name TYPE c LENGTH 10 VALUE '10000'.

WRITE: cust_name, ' - C LENGTH 10'.

* Conversion operator (CONV)

DATA(lv_conv_value) = CONV int4( cust_name ).

WRITE: /, lv_conv_value, ' - Converted to INT4'.
