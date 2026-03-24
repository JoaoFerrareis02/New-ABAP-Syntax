*&---------------------------------------------------------------------*
*& Report z_value_operator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_value_operator.

* VALUE Operator

* Creates a value with specified 'type'

**********************************************************************

* Create an internal table

TYPES char_tab TYPE TABLE OF char20 WITH EMPTY KEY.

DATA(char_data) = VALUE char_tab( ( 'Firstrow' ) ( 'Secondrow' ) ( 'Thirdrow' ) ).

LOOP AT char_data ASSIGNING FIELD-SYMBOL(<char>).
  WRITE: /,<char>.
ENDLOOP.

**********************************************************************

* Create an range table

DATA itab TYPE RANGE OF i.

itab = VALUE #( sign = 'I' option = 'BT' ( low = 1 high = 20 )
                                         ( low = 21 high = 30 )
                                         ( low = 31 high = 50 )
                           option = 'GE' ( low = 61 ) ).

LOOP AT itab ASSIGNING FIELD-SYMBOL(<wa>).
  WRITE: /, <wa>-sign, <wa>-option, <wa>-low, <wa>-high.
ENDLOOP.

**********************************************************************
