defmodule BoomBoxWeb.PageController do
  use BoomBoxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
