defmodule BoomBox.Artists.Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artist" do
    field :name, :string
    has_many :following_artist, BoomBox.Following_Artists.Following_Artist
    has_many :leaderboard, BoomBox.Leaderboards.Leaderboard

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
