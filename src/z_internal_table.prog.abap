*&---------------------------------------------------------------------*
*& Report z_internal_table
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_internal_table.

" Bellow are the new functionalities to work with internal tables

SELECT * FROM sflight INTO TABLE @DATA(lt_sflight).

" 1. Read table

"READ TABLE lt_sflight INTO DATA(ls_sflight) INDEX 1.
DATA(ls_sflight) = lt_sflight[ 1 ].

"READ TABLE lt_sflight INTO DATA(ls_sflight2) WITH KEY carrid = 'AA'.
DATA(ls_sflight2) = lt_sflight[ carrid = 'AA' ].

"READ TABLE lt_sflight WITH KEY carrid = 'AA' TRANSPORTING NO FIELDS.
"IF sy-subrc = 0.
"ENDIF.
IF line_exists( lt_sflight[ carrid = 'AA' ] ).
ENDIF.

"READ TABLE lt_sflight WITH KEY carrid = 'AA' TRANSPORTING NO FIELDS.
"DATA(i_dx) = sy-tabix.
DATA(i_dx) = line_index( lt_sflight[ carrid = 'AA' ] ).
