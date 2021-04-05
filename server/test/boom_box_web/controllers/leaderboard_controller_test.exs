defmodule BoomBoxWeb.LeaderboardControllerTest do
  use BoomBoxWeb.ConnCase

  alias BoomBox.Leaderboards
  alias BoomBox.Leaderboards.Leaderboard

  @create_attrs %{
    count: 42
  }
  @update_attrs %{
    count: 43
  }
  @invalid_attrs %{count: nil}

  def fixture(:leaderboard) do
    {:ok, leaderboard} = Leaderboards.create_leaderboard(@create_attrs)
    leaderboard
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all leaderboard", %{conn: conn} do
      conn = get(conn, Routes.leaderboard_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create leaderboard" do
    test "renders leaderboard when data is valid", %{conn: conn} do
      conn = post(conn, Routes.leaderboard_path(conn, :create), leaderboard: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.leaderboard_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.leaderboard_path(conn, :create), leaderboard: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update leaderboard" do
    setup [:create_leaderboard]

    test "renders leaderboard when data is valid", %{conn: conn, leaderboard: %Leaderboard{id: id} = leaderboard} do
      conn = put(conn, Routes.leaderboard_path(conn, :update, leaderboard), leaderboard: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.leaderboard_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, leaderboard: leaderboard} do
      conn = put(conn, Routes.leaderboard_path(conn, :update, leaderboard), leaderboard: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete leaderboard" do
    setup [:create_leaderboard]

    test "deletes chosen leaderboard", %{conn: conn, leaderboard: leaderboard} do
      conn = delete(conn, Routes.leaderboard_path(conn, :delete, leaderboard))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.leaderboard_path(conn, :show, leaderboard))
      end
    end
  end

  defp create_leaderboard(_) do
    leaderboard = fixture(:leaderboard)
    %{leaderboard: leaderboard}
  end
end
