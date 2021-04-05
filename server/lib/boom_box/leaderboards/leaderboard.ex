defmodule BoomBox.Leaderboards.Leaderboard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "leaderboard" do
    field :count, :integer
    belongs_to :artist, Boombox.Artists.Artist

    timestamps()
  end

  @doc false
  def changeset(leaderboard, attrs) do
    leaderboard
    |> cast(attrs, [:count, :artist_id])
    |> validate_required([:count, :artist_id])
  end
end
