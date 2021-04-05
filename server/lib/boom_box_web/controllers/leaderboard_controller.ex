defmodule BoomBoxWeb.LeaderboardController do
  use BoomBoxWeb, :controller

  alias BoomBox.Leaderboards
  alias BoomBox.Leaderboards.Leaderboard

  action_fallback BoomBoxWeb.FallbackController

  def index(conn, _params) do
    leaderboard = Leaderboards.list_leaderboard()
    render(conn, "index.json", leaderboard: leaderboard)
  end

  def create(conn, %{"leaderboard" => leaderboard_params}) do
    with {:ok, %Leaderboard{} = leaderboard} <- Leaderboards.create_leaderboard(leaderboard_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.leaderboard_path(conn, :show, leaderboard))
      |> render("show.json", leaderboard: leaderboard)
    end
  end

  def show(conn, %{"id" => id}) do
    leaderboard = Leaderboards.get_leaderboard!(id)
    render(conn, "show.json", leaderboard: leaderboard)
  end

  def update(conn, %{"id" => id, "leaderboard" => leaderboard_params}) do
    leaderboard = Leaderboards.get_leaderboard!(id)

    with {:ok, %Leaderboard{} = leaderboard} <- Leaderboards.update_leaderboard(leaderboard, leaderboard_params) do
      render(conn, "show.json", leaderboard: leaderboard)
    end
  end

  def delete(conn, %{"id" => id}) do
    leaderboard = Leaderboards.get_leaderboard!(id)

    with {:ok, %Leaderboard{}} <- Leaderboards.delete_leaderboard(leaderboard) do
      send_resp(conn, :no_content, "")
    end
  end
end
