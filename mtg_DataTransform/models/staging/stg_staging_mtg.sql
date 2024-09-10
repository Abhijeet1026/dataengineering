with 

source as (
    select * from {{ source('staging', 'default_cards_data')}}
),

renamed as (
    select
       
        id,
        name,
        released_at,
        color_identity,
        {{ get_color_idenity_description('color_identity') }} as color,
        set_name,
        artist,
        usd_prices,
        euro_prices,
        DataExtraction_date
    from source
)

select * from renamed