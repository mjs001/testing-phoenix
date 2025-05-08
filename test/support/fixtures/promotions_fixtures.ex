defmodule LearningPhoenix.PromotionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearningPhoenix.Promotions` context.
  """

  # Generate a unique promotion code.

  def unique_promotion_code, do: "some code#{System.unique_integer([:positive])}"

  # Generate a promotion.
  def promotion_fixture(attrs \\ %{})

  def promotion_fixture(attrs) do
    {:ok, promotion} =
      attrs
      |> Enum.into(%{
        code: unique_promotion_code(),
        expires_at: ~U[2025-05-05 18:00:00Z],
        name: "some name"
      })
      |> LearningPhoenix.Promotions.create_promotion()

    promotion
  end
end

#   def promotion_fixture(attrs) do
#     {:ok, promotion} =
#       attrs
#       |> Enum.into(%{
#         code: unique_promotion_code(),
#         name: "some name"
#       })
#       |> LearningPhoenix.Promotions.create_promotion()

#     promotion
#   end
# end
