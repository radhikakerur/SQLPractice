# Stratascratch
# Find how many times each artist appeared on the Spotify ranking list

select artist
    , count(artist) as occurrences
from spotify_worldwide_daily_song_ranking
group by artist
order by count(artist) desc
