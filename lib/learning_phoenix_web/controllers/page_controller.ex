defmodule LearningPhoenixWeb.PageController do
  use LearningPhoenixWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    current_user = conn.assigns[:current_user]

    if current_user do
      render(conn, :home, current_user: current_user)
    else
      render(conn, :home, current_user: nil)
    end
  end

  def hello(conn, _params) do
    # text(conn, "hello")
    redirect(conn, to: ~p"/")
  end
end
