defmodule BoomBox.Repo.Migrations.CreateArtist do
  use Ecto.Migration

  def change do
    create table(:artist) do
      add :name, :string, null: false

      timestamps()
    end

  end
end
