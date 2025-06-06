defmodule LearningPhoenix.Products do
  alias LearningPhoenix.Products.Product
  alias LearningPhoenix.Repo

  def list_all_products, do: Repo.all(Product)

  def find_product_by_slug(slug) when is_binary(slug) do
    Repo.get_by(Product, slug: slug)
  end

  def find_product_by_id(id), do: Repo.get(Product, id)

  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def update_a_product(%Product{} = product, attrs) do
    # product_to_update = find_product_by_id(id)
    # changeset = Product.changeset(product_to_update, attrs)
    # Repo.update(changeset)
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  def delete_product(product = %Product{}) do
    Repo.delete(product)
  end
end
