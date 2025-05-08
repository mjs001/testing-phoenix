defmodule LearningPhoenix.ProductsTest do
  use LearningPhoenix.DataCase

  alias LearningPhoenix.Products
  import LearningPhoenix.ProductsFixtures

  test "create_product/1 creates a product" do
    assert {:ok, _product} =
             Products.create_product(%{name: "game 2", console: :nintendo})
  end

  test "list_all_products/0 returns all products" do
    products = product_fixtures()
    assert Products.list_all_products() == [products]
  end
end
