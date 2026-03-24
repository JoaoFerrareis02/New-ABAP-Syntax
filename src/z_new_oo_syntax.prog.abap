*&---------------------------------------------------------------------*
*& Report z_new_oo_syntax
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_new_oo_syntax.

**********************************************************************

* New Object Oriented ABAP Syntax

CLASS lcl_pers_data DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_name TYPE char20,
      write_name.
  PRIVATE SECTION.
    DATA: v_name TYPE char20.
ENDCLASS.

CLASS lcl_pers_data IMPLEMENTATION.
  METHOD constructor.
    WRITE: / 'New person created:', iv_name.
    v_name = iv_name.
  ENDMETHOD.
  METHOD write_name.
    WRITE: / 'Writing person :', v_name.
  ENDMETHOD.
ENDCLASS.

CLASS subclass1 DEFINITION INHERITING FROM lcl_pers_data.
ENDCLASS.

**********************************************************************

START-OF-SELECTION.

  DATA(lo_pers) = NEW lcl_pers_data( iv_name = 'João' ).

  lo_pers->write_name( ).


* IS INSTANCE OF

  DATA: lo_sup TYPE REF TO lcl_pers_data
        ,lo_sub TYPE REF TO subclass1.

  lo_sub = NEW #( 'Carlos' ).

  IF lo_sub IS INSTANCE OF subclass1.
    lo_sup ?= lo_sub.
  ENDIF.
