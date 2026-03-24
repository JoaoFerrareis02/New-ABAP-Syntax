*&---------------------------------------------------------------------*
*& Report z_reduce_operator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_reduce_operator.

**********************************************************************

* New Syntax - REDUCE Operator

TYPES: BEGIN OF ty_employee,
         id   TYPE i,
         name TYPE string,
         age  TYPE i,
       END OF ty_employee.

DATA: gt_employees TYPE STANDARD TABLE OF ty_employee.

gt_employees = VALUE #(
  ( id = 1 name = 'JOHN'  age = 25 )
  ( id = 2 name = 'MARIA' age = 17 )
  ( id = 3 name = 'CARL'  age = 30 )
).

DATA: lv_lines TYPE i.

lv_lines = REDUCE #( INIT x = 0
                     FOR ls_employee IN gt_employees wHERE ( age >= 18 )
                     NEXT x = x + 1 ).

IF sy-subrc = 0.
   WRITE lv_lines.
endif.
