defmodule LearningPhoenix.ProductControllerTest do
  use LearningPhoenixWeb.ConnCase
  import LearningPhoenix.ProductsFixtures

  test "GET /products", %{conn: conn} do
    product = product_fixtures(%{name: "Super Smash Bros Melee", console: :nintendo})
    conn = get(conn, "/products")
    assert html_response(conn, 200) =~ product.name
  end

  test "GET /products/:slug", %{conn: conn} do
    product = product_fixtures(%{name: "Kirby 4", console: :nintendo})
    conn = get(conn, "/products/#{product.slug}")
    assert html_response(conn, 200) =~ product.name
    assert html_response(conn, 200) =~ to_string(product.console)
  end
end
