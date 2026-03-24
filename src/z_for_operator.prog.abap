*&---------------------------------------------------------------------*
*& Report z_for_operator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_for_operator.

* FOR Operator

* Used to loop at an internal table.

TYPES: BEGIN OF ty_employee,
         id   TYPE i,
         name TYPE string,
         age  TYPE i,
       END OF ty_employee.

DATA: gt_employees TYPE STANDARD TABLE OF ty_employee,
      gt_names     TYPE STANDARD TABLE OF string,
      gt_adults    TYPE STANDARD TABLE OF ty_employee,
      gt_numbers   TYPE STANDARD TABLE OF i.

gt_employees = VALUE #(
  ( id = 1 name = 'JOHN'  age = 25 )
  ( id = 2 name = 'MARIA' age = 17 )
  ( id = 3 name = 'CARL'  age = 30 )
).

gt_names = VALUE #( FOR ls_employee IN gt_employees ( ls_employee-name ) ).

gt_adults = VALUE #( FOR ls_employee IN gt_employees WHERE ( age >= 18 ) ( ls_employee ) ).

IF sy-subrc = 0.
ENDIF.
