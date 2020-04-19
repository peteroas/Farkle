defmodule Farkle.Repo.Migrations.CreateScores do
  use Ecto.Migration

  def change do
    create table(:scores) do
      add :player, references(:players, on_delete: :nothing)
      add :game, references(:games, on_delete: :nothing)

      timestamps()
    end

    create index(:scores, [:player])
    create index(:scores, [:game])
  end
end
