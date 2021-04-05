defmodule BoomBox.Repo.Migrations.CreateFollowingArtist do
  use Ecto.Migration

  def change do
    create table(:following_artist) do
      add :follower_id, references(:users, on_delete: :nothing), null: false
      add :artist_id, references(:artist, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:following_artist, [:follower_id, :artist_id])
  end
end
