defmodule LearningPhoenixWeb.ApiJSON do
  def index(%{products: products}) do
    %{products: products}
  end
end
