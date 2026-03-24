*&---------------------------------------------------------------------*
*& Report z_cond_operator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_cond_operator.

**********************************************************************

* New Syntax - COND Operator

DATA: gv_val1     TYPE i VALUE 4,
      gv_val2     TYPE i VALUE 5,
      gv_operator TYPE c LENGTH 1 VALUE '*'.

DATA(gv_result) = COND i( WHEN gv_operator = '+' THEN gv_val1 + gv_val2
                          WHEN gv_operator = '-' THEN gv_val1 - gv_val2
                          WHEN gv_operator = '/' THEN gv_val1 / gv_val2
                          WHEN gv_operator = '*' THEN gv_val1 * gv_val2 ).

WRITE |{ gv_val1 } { gv_operator } { gv_val2 } = { gv_result }|.

**********************************************************************

* New Syntax - SWITCH Operator

DATA(gv_result2) = SWITCH i( gv_operator
                                WHEN '+' THEN gv_val1 + gv_val2
                                WHEN '-' THEN gv_val1 - gv_val2
                                WHEN '/' THEN gv_val1 / gv_val2
                                WHEN '*' THEN gv_val1 * gv_val2 ).

WRITE: /, |{ gv_val1 } { gv_operator } { gv_val2 } = { gv_result2 }|.

**********************************************************************
