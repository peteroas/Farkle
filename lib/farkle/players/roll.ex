defmodule Farkle.Players.Roll do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rolls" do
    field :locked?, :boolean, default: false
    field :number, :integer

    timestamps()
  end

  @doc false
  def changeset(roll, attrs) do
    roll
    |> cast(attrs, [:locked?, :number])
    |> validate_required([:locked?, :number])
  end
end
