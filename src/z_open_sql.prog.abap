*&---------------------------------------------------------------------*
*& Report z_open_sql
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_open_sql.

**********************************************************************

* New Open SQL Syntax

* ABAP 7.4

*SELECT carrid,
*       connid,
*       fldate,
*       price,
*       currency,
*       planetype,
*       seatsmax
*    FROM sflight
*    INTO TABLE @DATA(lt_sflight)
*    WHERE currency = 'USD'.
*
*cl_demo_output=>display( lt_sflight ).

* ABAP 7.5

SELECT FROM sflight
    FIELDS  carrid,
            connid,
            fldate,
            price,
            currency,
            planetype,
            seatsmax,
            CASE
                WHEN price >= 700 THEN 'High'
                ELSE 'Low'
            END AS is_high
    WHERE currency = 'USD'
    AND price >= '500.00'
UNION ALL
SELECT FROM sflight
    FIELDS  carrid,
            connid,
            fldate,
            price,
            currency,
            planetype,
            seatsmax,
            CASE
                WHEN price >= 700 THEN 'High'
                ELSE 'Low'
            END AS is_high
    WHERE currency = 'EUR'
    INTO TABLE @DATA(lt_sflight).

cl_demo_output=>display( lt_sflight ).
