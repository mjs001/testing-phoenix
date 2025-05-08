defmodule LearningPhoenixWeb.ApiController do
  use LearningPhoenixWeb, :controller
  alias LearningPhoenix.Products

  def index(conn, _params) do
    products = Products.list_all_products()

    conn
    |> assign(:products, products)
    |> render(:index)
  end
end
