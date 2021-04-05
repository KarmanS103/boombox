defmodule BoomBoxWeb.Following_ArtistView do
  use BoomBoxWeb, :view
  alias BoomBoxWeb.Following_ArtistView

  def render("index.json", %{following_artist: following_artist}) do
    %{data: render_many(following_artist, Following_ArtistView, "following__artist.json")}
  end

  def render("show.json", %{following__artist: following__artist}) do
    %{data: render_one(following__artist, Following_ArtistView, "following__artist.json")}
  end

  def render("following__artist.json", %{following__artist: following__artist}) do
    %{id: following__artist.id}
  end
end
