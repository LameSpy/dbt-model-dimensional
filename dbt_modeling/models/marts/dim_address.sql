with stg_address as (
    select *
    from {{ref('address')}}
),

stg_product_stateprovince as (
    select *
    from {{ref('stateprovince')}}
),

stg_product_countryregion as (
    select *
    from {{ref('countryregion')}}
)


select {{-dbt_utils.generate_surrogate_key(['stg_address.addressid'])-}} as address_key,
stg_address.addressid,
stg_address.city as city_name,
stg_product_stateprovince.name as state_name,
stg_product_countryregion.name as country_name
from stg_address
left join stg_product_stateprovince on stg_address.stateprovinceid = stg_product_stateprovince.stateprovinceid
left join stg_product_countryregion on stg_product_stateprovince.countryregioncode = stg_product_countryregion.countryregioncode