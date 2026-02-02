{{ config(
    materialized='incremental',
    unique_key='listing_id'
) }}

{% set incremental_col = 'CREATED_AT' %}

SELECT *
FROM {{ source('staging', 'listings') }}

{% if is_incremental() %}
WHERE {{ incremental_col }} > (SELECT MAX({{ incremental_col }}) FROM {{ this }})
{% endif %}