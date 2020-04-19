defmodule Farkle.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset

  alias Farkle.Games.Game

  schema "players" do
    field :current_score, :integer
    field :name, :string

    many_to_many(:games, Game, join_through: "players_games")

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :current_score])
    |> validate_required([:name, :current_score])
  end
end
