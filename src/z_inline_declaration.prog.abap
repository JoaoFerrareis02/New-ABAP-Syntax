*&---------------------------------------------------------------------*
*& Report z_inline_declaration
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_inline_declaration.

" In-line declarations are a new way of declaring variables and field symbols.

" 1. Declaration of variable
DATA(l_str_val) = 'Welcome to the training'.
WRITE: 'New syntax: ', l_str_val.

WRITE: / '**********************************************************************'.

" 2. Select from
SELECT SINGLE * FROM scarr INTO @DATA(ls_scarr) WHERE carrid = 'AA'.

WRITE: / 'SCARR(AA): ', ls_scarr-carrid, ls_scarr-carrname, ls_scarr-currcode, ls_scarr-url.

WRITE: / '**********************************************************************'.

" 3. Loop over an internal table (variable and field-symbol)
SELECT * FROM scarr INTO TABLE @DATA(lt_tab).

LOOP AT lt_tab INTO DATA(ls_wa).
  WRITE: / 'SCARR(',ls_wa-carrid,'): ', ls_wa-carrid, ls_wa-carrname, ls_wa-currcode, ls_wa-url.
ENDLOOP.

*LOOP AT lt_tab ASSIGNING FIELD-SYMBOL(<fs_wa>).
*  WRITE: / 'SCARR(',<fs_wa>-carrid,'): ', <fs_wa>-carrid, <fs_wa>-carrname, <fs_wa>-currcode, <fs_wa>-url.
*ENDLOOP.

WRITE: / '**********************************************************************'.

" 4. Field-symbols and select from table
DATA(lv_carrid) = 'AA'.

SELECT *
FROM sflight
INTO TABLE @DATA(lt_sflight)
WHERE carrid = @lv_carrid.

LOOP AT lt_sflight ASSIGNING FIELD-SYMBOL(<fs_sflight>).
  WRITE: / 'SFLIGHT(',<fs_sflight>-carrid,'): ', <fs_sflight>-carrid, <fs_sflight>-connid, <fs_sflight>-currency, <fs_sflight>-fldate, <fs_sflight>-paymentsum, <fs_sflight>-planetype, <fs_sflight>-price.
ENDLOOP.

WRITE: / '**********************************************************************'.
