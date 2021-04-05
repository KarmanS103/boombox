defmodule BoomBoxWeb.LeaderboardView do
  use BoomBoxWeb, :view
  alias BoomBoxWeb.LeaderboardView

  def render("index.json", %{leaderboard: leaderboard}) do
    %{data: render_many(leaderboard, LeaderboardView, "leaderboard.json")}
  end

  def render("show.json", %{leaderboard: leaderboard}) do
    %{data: render_one(leaderboard, LeaderboardView, "leaderboard.json")}
  end

  def render("leaderboard.json", %{leaderboard: leaderboard}) do
    %{id: leaderboard.id,
      count: leaderboard.count}
  end
end
