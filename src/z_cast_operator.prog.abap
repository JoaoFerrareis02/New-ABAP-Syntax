*&---------------------------------------------------------------------*
*& Report z_cast_operator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_cast_operator.

**********************************************************************

* Old Syntax

*DATA: structdescr TYPE REF TO cl_abap_structdescr.
*
*structdescr ?= cl_abap_typedescr=>describe_by_name( 'SFLIGHT' ).
*
*DATA: components TYPE abap_compdescr_tab.
*
*components = structdescr->components.
*
*IF sy-subrc = 0.
*ENDIF.

**********************************************************************

* New Syntax - CAST Operator

DATA(components) = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_name( 'SFLIGHT' ) )->components.

IF sy-subrc = 0.
ENDIF.
