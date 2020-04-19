defmodule Farkle.Players do
  @moduledoc """
  The Players context.
  """

  import Ecto.Query, warn: false
  alias Farkle.Repo

  alias Farkle.Players.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{source: %Player{}}

  """
  def change_player(%Player{} = player) do
    Player.changeset(player, %{})
  end

  alias Farkle.Players.Score

  @doc """
  Returns the list of scores.

  ## Examples

      iex> list_scores()
      [%Score{}, ...]

  """
  def list_scores do
    Repo.all(Score)
  end

  @doc """
  Gets a single score.

  Raises `Ecto.NoResultsError` if the Score does not exist.

  ## Examples

      iex> get_score!(123)
      %Score{}

      iex> get_score!(456)
      ** (Ecto.NoResultsError)

  """
  def get_score!(id), do: Repo.get!(Score, id)

  @doc """
  Creates a score.

  ## Examples

      iex> create_score(%{field: value})
      {:ok, %Score{}}

      iex> create_score(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_score(attrs \\ %{}) do
    %Score{}
    |> Score.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a score.

  ## Examples

      iex> update_score(score, %{field: new_value})
      {:ok, %Score{}}

      iex> update_score(score, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_score(%Score{} = score, attrs) do
    score
    |> Score.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a score.

  ## Examples

      iex> delete_score(score)
      {:ok, %Score{}}

      iex> delete_score(score)
      {:error, %Ecto.Changeset{}}

  """
  def delete_score(%Score{} = score) do
    Repo.delete(score)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking score changes.

  ## Examples

      iex> change_score(score)
      %Ecto.Changeset{source: %Score{}}

  """
  def change_score(%Score{} = score) do
    Score.changeset(score, %{})
  end

  alias Farkle.Players.Roll

  @doc """
  Returns the list of rolls.

  ## Examples

      iex> list_rolls()
      [%Roll{}, ...]

  """
  def list_rolls do
    Repo.all(Roll)
  end

  @doc """
  Gets a single roll.

  Raises `Ecto.NoResultsError` if the Roll does not exist.

  ## Examples

      iex> get_roll!(123)
      %Roll{}

      iex> get_roll!(456)
      ** (Ecto.NoResultsError)

  """
  def get_roll!(id), do: Repo.get!(Roll, id)

  @doc """
  Creates a roll.

  ## Examples

      iex> create_roll(%{field: value})
      {:ok, %Roll{}}

      iex> create_roll(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_roll(attrs \\ %{}) do
    %Roll{}
    |> Roll.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a roll.

  ## Examples

      iex> update_roll(roll, %{field: new_value})
      {:ok, %Roll{}}

      iex> update_roll(roll, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_roll(%Roll{} = roll, attrs) do
    roll
    |> Roll.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a roll.

  ## Examples

      iex> delete_roll(roll)
      {:ok, %Roll{}}

      iex> delete_roll(roll)
      {:error, %Ecto.Changeset{}}

  """
  def delete_roll(%Roll{} = roll) do
    Repo.delete(roll)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking roll changes.

  ## Examples

      iex> change_roll(roll)
      %Ecto.Changeset{source: %Roll{}}

  """
  def change_roll(%Roll{} = roll) do
    Roll.changeset(roll, %{})
  end
end
