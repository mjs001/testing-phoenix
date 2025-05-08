defmodule LearningPhoenixWeb.ProductJSON do
  def index(%{products: products}) do
    %{
      data: products
    }
  end
end
