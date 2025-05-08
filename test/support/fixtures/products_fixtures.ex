defmodule LearningPhoenix.ProductsFixtures do
  def product_fixtures(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some game",
        console: :pc
      })
      |> LearningPhoenix.Products.create_product()

    product
  end
end
