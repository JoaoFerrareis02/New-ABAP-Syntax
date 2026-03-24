*&---------------------------------------------------------------------*
*& Report z_corresponding_operator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_corresponding_operator.

**********************************************************************

* New Syntax - CORRESPONDING Operator

TYPES:
  BEGIN OF line1,
    col1 TYPE i,
    col2 TYPE i,
  END OF line1,

  BEGIN OF line2,
    col1 TYPE i,
    col2 TYPE i,
    col3 TYPE i,
  END OF line2.

DATA(l_workarea1) = VALUE line1( col1 = 1 col2 = 2 ).

DATA(l_workarea2) = CORRESPONDING line2( l_workarea1 ).

IF sy-subrc = 0.
ENDIF.

**********************************************************************

l_workarea2 = VALUE #( col1 = 4 col2 = 6 col3 = 8 ).

DATA(l_workarea3) = CORRESPONDING line2( BASE ( l_workarea2 ) l_workarea1 ).

IF sy-subrc = 0.
ENDIF.

**********************************************************************

* Assigning components using CL_ABAP_CORRESPONDING

DATA:BEGIN OF struct1,
       a1 TYPE string VALUE 'avalue1',
       a2 TYPE string VALUE 'avalue2',
       a3 TYPE string VALUE 'avalue3',
       a4 TYPE string VALUE 'avalue4',
       a5 TYPE string VALUE 'avalue5',
     END OF struct1,
     BEGIN OF struct2,
       b1 TYPE string VALUE 'bVal1',
       b2 TYPE string VALUE 'bVal2',
       b3 TYPE string VALUE 'bVal3',
       b4 TYPE string VALUE 'bVal4',
       b5 TYPE string VALUE 'bVal5',
     END OF struct2.

DATA(mapper) = cl_abap_corresponding=>create(
                 source                = struct1
                 destination           = struct2
                 mapping               = VALUE cl_abap_corresponding=>mapping_table(
                                                                            ( level = 0 kind = 1 srcname = 'a1' dstname = 'b3' )
                                                                            ( level = 0 kind = 1 srcname = 'a3' dstname = 'b1' )
                                                                            ( level = 0 kind = 3 ) )
               ).

mapper->execute(
  EXPORTING
    source      = struct1
  CHANGING
    destination = struct2
).

cl_demo_output=>display( struct2 ).
