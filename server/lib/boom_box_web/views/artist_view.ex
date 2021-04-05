defmodule BoomBoxWeb.ArtistView do
  use BoomBoxWeb, :view
  alias BoomBoxWeb.ArtistView

  def render("index.json", %{artist: artist}) do
    %{data: render_many(artist, ArtistView, "artist.json")}
  end

  def render("show.json", %{artist: artist}) do
    %{data: render_one(artist, ArtistView, "artist.json")}
  end

  def render("artist.json", %{artist: artist}) do
    %{id: artist.id,
      name: artist.name}
  end
end
