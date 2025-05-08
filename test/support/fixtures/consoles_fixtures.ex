defmodule LearningPhoenix.ConsolesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearningPhoenix.Consoles` context.
  """

  @doc """
  Generate a console.
  """
  def console_fixture(attrs \\ %{}) do
    {:ok, console} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: 42
      })
      |> LearningPhoenix.Consoles.create_console()

    console
  end
end
