defmodule LearningPhoenixWeb.ProductLiveTest do
  use LearningPhoenixWeb.ConnCase
  import Phoenix.LiveViewTest
  import LearningPhoenix.ProductsFixtures

  setup do
    product = product_fixtures()
    {:ok, product_live, html} = live(build_conn(), ~p"/products-live")
    %{product: product, product_live: product_live, html: html}
  end

  describe "Product Live" do
    test "LIVE /products-live", %{html: html, product: product} do
      assert html =~ "#{product.name} - Likes: 0"
    end

    test "Clicking like increments the like count and clicking dislike decrements the like count",
         %{
           product_live: product_live,
           product: product
         } do
      html = render_click(product_live, :like, %{id: to_string(product.id)})
      assert html =~ "#{product.name} - Likes: 1"

      html = render_click(product_live, :dislike, %{id: to_string(product.id)})
      assert html =~ "#{product.name} - Likes: 0"
    end
  end
end
