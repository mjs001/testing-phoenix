defmodule LearningPhoenixWeb.TestController do
  use LearningPhoenixWeb, :controller

  def test(conn, _params) do
    render(conn, "test.html")
  end
end
