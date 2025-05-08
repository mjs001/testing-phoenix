defmodule LearningPhoenixWeb.ProductHTML do
  use LearningPhoenixWeb, :html
  alias LearningPhoenix.Products.Product
  embed_templates("product_html/*")
  attr(:product, Product, required: true)

  def product(assigns) do
    ~H"""
    <.link class="underline" href={~p"/products/#{@product.slug}"}>{@product.name}</.link>
    """
  end
end
