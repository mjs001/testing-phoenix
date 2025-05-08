defmodule LearningPhoenixWeb.ProductLive.Index do
  use LearningPhoenixWeb, :live_view
  alias LearningPhoenix.Products
  # TODO: implement likes and dislikes on the database
  def mount(_params, _session, socket) do
    products = Products.list_all_products()
    dbg(products)
    likes = products |> Enum.map(fn product -> {product.id, 0} end) |> Map.new()
    dbg(likes)
    {:ok, socket |> assign(:products, products) |> assign(:likes, likes)}
  end

  def handle_event("like", %{"id" => id}, socket) do
    id = if is_binary(id), do: String.to_integer(id), else: id
    likes = Map.put(socket.assigns.likes, id, socket.assigns.likes[id] + 1)
    socket = socket |> assign(:likes, likes)
    {:noreply, socket}
  end

  def handle_event("dislike", %{"id" => id}, socket) do
    # id = if is_binary(id), do: String.to_integer(id), else: id
    id = String.to_integer(id)
    dislikes = Map.put(socket.assigns.likes, id, socket.assigns.likes[id] - 1)
    socket = socket |> assign(:likes, dislikes)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <p>Working</p>
    <div :for={product <- @products}>
    {product.name} - Likes: {@likes[product.id]}
    <.icon name="hero-hand-thumb-down-solid" phx-click="dislike" phx-value-id={product.id} class="cursor-pointer focus:outline-none focus:ring-0 focus:ring-offset-0 select-none"/>
    <.icon name="hero-hand-thumb-up-solid" phx-click="like" phx-value-id={product.id} class="cursor-pointer focus:outline-none focus:ring-0 focus:ring-offset-0 select-none"/>
    </div>
    """
  end
end
