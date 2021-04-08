# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BoomBox.Repo.insert!(%BoomBox.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BoomBox.Repo
alias BoomBox.Artists.Artist
alias BoomBox.Leaderboards.Leaderboard

# Adding a list of some artists
drake = Repo.insert!(%Artist{name: "Drake"})
bieber = Repo.insert!(%Artist{name: "Justin Bieber"})
selena = Repo.insert!(%Artist{name: "Selena Gomez"})
taylor = Repo.insert!(%Artist{name: "Taylor Swift"})
weeknd = Repo.insert!(%Artist{name: "The Weeknd"})
lipa = Repo.insert!(%Artist{name: "Dua Lipa"})
grande = Repo.insert!(%Artist{name: "Ariana Grande"})
durk = Repo.insert!(%Artist{name: "Lil Durk"})
bts = Repo.insert!(%Artist{name: "BTS"})
future = Repo.insert!(%Artist{name: "Future"})

# Adding their starting leaderboard positions
l1 = %Leaderboard{
    artist_id: drake.id,
    count: 38020842
}

l2 = %Leaderboard{
    artist_id: bieber.id,
    count: 1384902
}

l3 = %Leaderboard{
    artist_id: selena.id,
    count: 13024
}

l4 = %Leaderboard{
    artist_id: taylor.id,
    count: 194084
}

Repo.insert!(l1)
Repo.insert!(l2)
Repo.insert!(l3)
Repo.insert!(l4)