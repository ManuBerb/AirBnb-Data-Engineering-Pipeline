{% macro multiply(x, y, precision)%} -- multiply two columns
    round({{ x }} * {{ y }}, {{ precision }})
{%- endmacro %}