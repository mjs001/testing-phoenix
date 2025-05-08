defmodule LearningPhoenixWeb.RandomController do
  use LearningPhoenixWeb, :controller

  def random(conn, _params) do
    # json(conn, %{key: "value"})
    render(conn, :random)
  end
end
