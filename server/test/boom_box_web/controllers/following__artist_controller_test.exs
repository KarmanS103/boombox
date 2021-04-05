defmodule BoomBoxWeb.Following_ArtistControllerTest do
  use BoomBoxWeb.ConnCase

  alias BoomBox.Following_Artists
  alias BoomBox.Following_Artists.Following_Artist

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:following__artist) do
    {:ok, following__artist} = Following_Artists.create_following__artist(@create_attrs)
    following__artist
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all following_artist", %{conn: conn} do
      conn = get(conn, Routes.following__artist_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create following__artist" do
    test "renders following__artist when data is valid", %{conn: conn} do
      conn = post(conn, Routes.following__artist_path(conn, :create), following__artist: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.following__artist_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.following__artist_path(conn, :create), following__artist: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update following__artist" do
    setup [:create_following__artist]

    test "renders following__artist when data is valid", %{conn: conn, following__artist: %Following_Artist{id: id} = following__artist} do
      conn = put(conn, Routes.following__artist_path(conn, :update, following__artist), following__artist: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.following__artist_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, following__artist: following__artist} do
      conn = put(conn, Routes.following__artist_path(conn, :update, following__artist), following__artist: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete following__artist" do
    setup [:create_following__artist]

    test "deletes chosen following__artist", %{conn: conn, following__artist: following__artist} do
      conn = delete(conn, Routes.following__artist_path(conn, :delete, following__artist))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.following__artist_path(conn, :show, following__artist))
      end
    end
  end

  defp create_following__artist(_) do
    following__artist = fixture(:following__artist)
    %{following__artist: following__artist}
  end
end
