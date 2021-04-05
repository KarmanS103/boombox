defmodule BoomBox.Following_ArtistsTest do
  use BoomBox.DataCase

  alias BoomBox.Following_Artists

  describe "following_artist" do
    alias BoomBox.Following_Artists.Following_Artist

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def following__artist_fixture(attrs \\ %{}) do
      {:ok, following__artist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Following_Artists.create_following__artist()

      following__artist
    end

    test "list_following_artist/0 returns all following_artist" do
      following__artist = following__artist_fixture()
      assert Following_Artists.list_following_artist() == [following__artist]
    end

    test "get_following__artist!/1 returns the following__artist with given id" do
      following__artist = following__artist_fixture()
      assert Following_Artists.get_following__artist!(following__artist.id) == following__artist
    end

    test "create_following__artist/1 with valid data creates a following__artist" do
      assert {:ok, %Following_Artist{} = following__artist} = Following_Artists.create_following__artist(@valid_attrs)
    end

    test "create_following__artist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Following_Artists.create_following__artist(@invalid_attrs)
    end

    test "update_following__artist/2 with valid data updates the following__artist" do
      following__artist = following__artist_fixture()
      assert {:ok, %Following_Artist{} = following__artist} = Following_Artists.update_following__artist(following__artist, @update_attrs)
    end

    test "update_following__artist/2 with invalid data returns error changeset" do
      following__artist = following__artist_fixture()
      assert {:error, %Ecto.Changeset{}} = Following_Artists.update_following__artist(following__artist, @invalid_attrs)
      assert following__artist == Following_Artists.get_following__artist!(following__artist.id)
    end

    test "delete_following__artist/1 deletes the following__artist" do
      following__artist = following__artist_fixture()
      assert {:ok, %Following_Artist{}} = Following_Artists.delete_following__artist(following__artist)
      assert_raise Ecto.NoResultsError, fn -> Following_Artists.get_following__artist!(following__artist.id) end
    end

    test "change_following__artist/1 returns a following__artist changeset" do
      following__artist = following__artist_fixture()
      assert %Ecto.Changeset{} = Following_Artists.change_following__artist(following__artist)
    end
  end
end
