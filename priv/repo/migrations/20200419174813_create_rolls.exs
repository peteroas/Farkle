defmodule Farkle.Repo.Migrations.CreateRolls do
  use Ecto.Migration

  def change do
    create table(:rolls) do
      add :locked?, :boolean, default: false, null: false
      add :number, :integer

      timestamps()
    end

  end
end
