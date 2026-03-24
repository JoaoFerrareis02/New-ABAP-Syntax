*&---------------------------------------------------------------------*
*& Report z_string_processing
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_string_processing.

" Here are some new functionalities for string processing

" 1. Concatenation of strings.

DATA(l_str1) = 'Hello'.
DATA(l_value1) = 10000.

DATA(l_out) = l_str1 && ', your power level is above ' && l_value1 && '!!!'.

WRITE l_out.

" 2. String templates

DATA(lv_out2) = |{ l_str1 }, your return code is { l_value1 }|.
WRITE: / lv_out2.

" 3. ALPHA Formating

DATA(lv_out3) = |{ '0000001212' ALPHA = OUT }|.
"DATA(lv_out3) = |{ '1212' ALPHA = IN }|.
WRITE: / lv_out3.
