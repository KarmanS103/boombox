defmodule BoomBox.Following_Artists.Following_Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "following_artist" do
    belongs_to :user, BoomBox.Users.User
    belongs_to :artist, BoomBox.Artists.Artist

    timestamps()
  end

  @doc false
  def changeset(following__artist, attrs) do
    following__artist
    |> cast(attrs, [:user_id, :artist_id])
    |> validate_required([:user_id, :artist_id])
  end
end
