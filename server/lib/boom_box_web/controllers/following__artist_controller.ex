defmodule BoomBoxWeb.Following_ArtistController do
  use BoomBoxWeb, :controller

  alias BoomBox.Following_Artists
  alias BoomBox.Following_Artists.Following_Artist

  action_fallback BoomBoxWeb.FallbackController

  def index(conn, _params) do
    following_artist = Following_Artists.list_following_artist()
    render(conn, "index.json", following_artist: following_artist)
  end

  def create(conn, %{"following__artist" => following__artist_params}) do
    with {:ok, %Following_Artist{} = following__artist} <- Following_Artists.create_following__artist(following__artist_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.following__artist_path(conn, :show, following__artist))
      |> render("show.json", following__artist: following__artist)
    end
  end

  def show(conn, %{"id" => id}) do
    following__artist = Following_Artists.get_following__artist!(id)
    render(conn, "show.json", following__artist: following__artist)
  end

  def update(conn, %{"id" => id, "following__artist" => following__artist_params}) do
    following__artist = Following_Artists.get_following__artist!(id)

    with {:ok, %Following_Artist{} = following__artist} <- Following_Artists.update_following__artist(following__artist, following__artist_params) do
      render(conn, "show.json", following__artist: following__artist)
    end
  end

  def delete(conn, %{"id" => id}) do
    following__artist = Following_Artists.get_following__artist!(id)

    with {:ok, %Following_Artist{}} <- Following_Artists.delete_following__artist(following__artist) do
      send_resp(conn, :no_content, "")
    end
  end
end
