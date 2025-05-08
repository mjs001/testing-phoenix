defmodule LearningPhoenix.Repo.Migrations.RemovePromotionsTable do
  use Ecto.Migration

  def change do
    drop(table("promotions"))
  end
end
