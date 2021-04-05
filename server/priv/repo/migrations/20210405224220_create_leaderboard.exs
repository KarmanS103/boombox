defmodule BoomBox.Repo.Migrations.CreateLeaderboard do
  use Ecto.Migration

  def change do
    create table(:leaderboard) do
      add :count, :integer, null: false
      add :artist_id, references(:artist, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:leaderboard, [:artist_id])
  end
end
