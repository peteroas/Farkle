defmodule Farkle.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :code, :string
      add :winning_score, :integer
      add :punishment, :string

      timestamps()
    end

  end
end
