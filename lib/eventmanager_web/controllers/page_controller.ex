defmodule EventmanagerWeb.PageController do
  use EventmanagerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
