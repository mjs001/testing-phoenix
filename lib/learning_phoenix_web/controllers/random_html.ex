defmodule LearningPhoenixWeb.RandomHTML do
  use LearningPhoenixWeb, :html

  def random(assigns) do
    ~H"""
    <h1>working</h1>
    """
  end
end
