defmodule Farkle.PlayersTest do
  use Farkle.DataCase

  alias Farkle.Players

  describe "players" do
    alias Farkle.Players.Player

    @valid_attrs %{current_score: 42, name: "some name"}
    @update_attrs %{current_score: 43, name: "some updated name"}
    @invalid_attrs %{current_score: nil, name: nil}

    def player_fixture(attrs \\ %{}) do
      {:ok, player} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Players.create_player()

      player
    end

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Players.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Players.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      assert {:ok, %Player{} = player} = Players.create_player(@valid_attrs)
      assert player.current_score == 42
      assert player.name == "some name"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Players.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      assert {:ok, %Player{} = player} = Players.update_player(player, @update_attrs)
      assert player.current_score == 43
      assert player.name == "some updated name"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Players.update_player(player, @invalid_attrs)
      assert player == Players.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Players.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Players.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Players.change_player(player)
    end
  end

  describe "scores" do
    alias Farkle.Players.Score

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def score_fixture(attrs \\ %{}) do
      {:ok, score} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Players.create_score()

      score
    end

    test "list_scores/0 returns all scores" do
      score = score_fixture()
      assert Players.list_scores() == [score]
    end

    test "get_score!/1 returns the score with given id" do
      score = score_fixture()
      assert Players.get_score!(score.id) == score
    end

    test "create_score/1 with valid data creates a score" do
      assert {:ok, %Score{} = score} = Players.create_score(@valid_attrs)
    end

    test "create_score/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Players.create_score(@invalid_attrs)
    end

    test "update_score/2 with valid data updates the score" do
      score = score_fixture()
      assert {:ok, %Score{} = score} = Players.update_score(score, @update_attrs)
    end

    test "update_score/2 with invalid data returns error changeset" do
      score = score_fixture()
      assert {:error, %Ecto.Changeset{}} = Players.update_score(score, @invalid_attrs)
      assert score == Players.get_score!(score.id)
    end

    test "delete_score/1 deletes the score" do
      score = score_fixture()
      assert {:ok, %Score{}} = Players.delete_score(score)
      assert_raise Ecto.NoResultsError, fn -> Players.get_score!(score.id) end
    end

    test "change_score/1 returns a score changeset" do
      score = score_fixture()
      assert %Ecto.Changeset{} = Players.change_score(score)
    end
  end

  describe "rolls" do
    alias Farkle.Players.Roll

    @valid_attrs %{locked?: true, number: 42}
    @update_attrs %{locked?: false, number: 43}
    @invalid_attrs %{locked?: nil, number: nil}

    def roll_fixture(attrs \\ %{}) do
      {:ok, roll} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Players.create_roll()

      roll
    end

    test "list_rolls/0 returns all rolls" do
      roll = roll_fixture()
      assert Players.list_rolls() == [roll]
    end

    test "get_roll!/1 returns the roll with given id" do
      roll = roll_fixture()
      assert Players.get_roll!(roll.id) == roll
    end

    test "create_roll/1 with valid data creates a roll" do
      assert {:ok, %Roll{} = roll} = Players.create_roll(@valid_attrs)
      assert roll.locked? == true
      assert roll.number == 42
    end

    test "create_roll/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Players.create_roll(@invalid_attrs)
    end

    test "update_roll/2 with valid data updates the roll" do
      roll = roll_fixture()
      assert {:ok, %Roll{} = roll} = Players.update_roll(roll, @update_attrs)
      assert roll.locked? == false
      assert roll.number == 43
    end

    test "update_roll/2 with invalid data returns error changeset" do
      roll = roll_fixture()
      assert {:error, %Ecto.Changeset{}} = Players.update_roll(roll, @invalid_attrs)
      assert roll == Players.get_roll!(roll.id)
    end

    test "delete_roll/1 deletes the roll" do
      roll = roll_fixture()
      assert {:ok, %Roll{}} = Players.delete_roll(roll)
      assert_raise Ecto.NoResultsError, fn -> Players.get_roll!(roll.id) end
    end

    test "change_roll/1 returns a roll changeset" do
      roll = roll_fixture()
      assert %Ecto.Changeset{} = Players.change_roll(roll)
    end
  end
end
