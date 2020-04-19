defmodule Farkle.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias Farkle.Players.Player

  @chars "ABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.split("")

  schema "games" do
    field :code, :string
    field :punishment, :string
    field :winning_score, :integer
    field :creator, :id

    many_to_many(:players, Player, join_through: "players_games")

    timestamps()
  end

  def new_changeset(game, attrs) do
    attrs =
      Map.merge(attrs, %{"code" => create_game_code()})

    game
    |> cast(attrs, [:code, :creator_id])
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:code, :winning_score, :punishment])
  end

  defp create_game_code do
    Enum.reduce((1..5), [], fn (_i, acc) ->
      [Enum.random(@chars) | acc]
    end) |> Enum.join("")
  end
end
