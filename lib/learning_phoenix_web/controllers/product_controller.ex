defmodule LearningPhoenixWeb.ProductController do
  use LearningPhoenixWeb, :controller
  alias LearningPhoenix.Products

  def index(conn, _params) do
    products = Products.list_all_products()

    conn
    |> assign(:products, products)
    |> assign(:shop_name, "Shop")
    |> render(:index)
  end

  def show(conn, %{"slug" => slug}) do
    product = Products.find_product_by_slug(slug)
    # product = Enum.find(@products, fn product -> product.id === id end)

    conn
    |> assign(:product, product)
    |> render(:show)
  end
end
