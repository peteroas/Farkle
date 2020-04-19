defmodule Farkle.Repo.Migrations.AddPlayersToGame do
  use Ecto.Migration

  def up do
    create table(:players_games) do
      add :game_id, references(:games)
      add :player_id, references(:players)
    end

    alter table(:games) do
      add :creator_id, references(:players)
    end

    alter table(:players) do
      remove :game
    end
  end

  def down do
    drop_if_exists table(:players_games)

    alter table(:games) do
      remove :creator_id
    end

    alter table(:players) do
      add :game, references(:games)
    end
  end
end
