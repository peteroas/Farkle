defmodule Farkle.Players.Score do
  use Ecto.Schema
  import Ecto.Changeset

  schema "scores" do
    field :player, :id
    field :game, :id

    timestamps()
  end

  @doc false
  def changeset(score, attrs) do
    score
    |> cast(attrs, [])
    |> validate_required([])
  end
end
