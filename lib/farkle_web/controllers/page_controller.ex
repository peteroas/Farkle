defmodule FarkleWeb.PageController do
  use FarkleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
