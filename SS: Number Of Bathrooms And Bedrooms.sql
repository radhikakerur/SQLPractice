# Stratascratch
# Number Of Bathrooms And Bedrooms

select city
    , property_type
    , avg(bedrooms)
    , avg(bathrooms)
from airbnb_search_details
group by city
    , property_type
