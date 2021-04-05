defmodule BoomBox.LeaderboardsTest do
  use BoomBox.DataCase

  alias BoomBox.Leaderboards

  describe "leaderboard" do
    alias BoomBox.Leaderboards.Leaderboard

    @valid_attrs %{count: 42}
    @update_attrs %{count: 43}
    @invalid_attrs %{count: nil}

    def leaderboard_fixture(attrs \\ %{}) do
      {:ok, leaderboard} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Leaderboards.create_leaderboard()

      leaderboard
    end

    test "list_leaderboard/0 returns all leaderboard" do
      leaderboard = leaderboard_fixture()
      assert Leaderboards.list_leaderboard() == [leaderboard]
    end

    test "get_leaderboard!/1 returns the leaderboard with given id" do
      leaderboard = leaderboard_fixture()
      assert Leaderboards.get_leaderboard!(leaderboard.id) == leaderboard
    end

    test "create_leaderboard/1 with valid data creates a leaderboard" do
      assert {:ok, %Leaderboard{} = leaderboard} = Leaderboards.create_leaderboard(@valid_attrs)
      assert leaderboard.count == 42
    end

    test "create_leaderboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Leaderboards.create_leaderboard(@invalid_attrs)
    end

    test "update_leaderboard/2 with valid data updates the leaderboard" do
      leaderboard = leaderboard_fixture()
      assert {:ok, %Leaderboard{} = leaderboard} = Leaderboards.update_leaderboard(leaderboard, @update_attrs)
      assert leaderboard.count == 43
    end

    test "update_leaderboard/2 with invalid data returns error changeset" do
      leaderboard = leaderboard_fixture()
      assert {:error, %Ecto.Changeset{}} = Leaderboards.update_leaderboard(leaderboard, @invalid_attrs)
      assert leaderboard == Leaderboards.get_leaderboard!(leaderboard.id)
    end

    test "delete_leaderboard/1 deletes the leaderboard" do
      leaderboard = leaderboard_fixture()
      assert {:ok, %Leaderboard{}} = Leaderboards.delete_leaderboard(leaderboard)
      assert_raise Ecto.NoResultsError, fn -> Leaderboards.get_leaderboard!(leaderboard.id) end
    end

    test "change_leaderboard/1 returns a leaderboard changeset" do
      leaderboard = leaderboard_fixture()
      assert %Ecto.Changeset{} = Leaderboards.change_leaderboard(leaderboard)
    end
  end
end
