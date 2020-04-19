defmodule Farkle.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :current_score, :integer
      add :game, references(:games, on_delete: :nothing)

      timestamps()
    end

    create index(:players, [:game])
  end
end
