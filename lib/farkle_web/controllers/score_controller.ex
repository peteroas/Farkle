defmodule FarkleWeb.ScoreController do
  use FarkleWeb, :controller

  alias Farkle.Players
  alias Farkle.Players.Score

  def index(conn, _params) do
    scores = Players.list_scores()
    render(conn, "index.html", scores: scores)
  end

  def new(conn, _params) do
    changeset = Players.change_score(%Score{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"score" => score_params}) do
    case Players.create_score(score_params) do
      {:ok, score} ->
        conn
        |> put_flash(:info, "Score created successfully.")
        |> redirect(to: Routes.score_path(conn, :show, score))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    score = Players.get_score!(id)
    render(conn, "show.html", score: score)
  end

  def edit(conn, %{"id" => id}) do
    score = Players.get_score!(id)
    changeset = Players.change_score(score)
    render(conn, "edit.html", score: score, changeset: changeset)
  end

  def update(conn, %{"id" => id, "score" => score_params}) do
    score = Players.get_score!(id)

    case Players.update_score(score, score_params) do
      {:ok, score} ->
        conn
        |> put_flash(:info, "Score updated successfully.")
        |> redirect(to: Routes.score_path(conn, :show, score))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", score: score, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    score = Players.get_score!(id)
    {:ok, _score} = Players.delete_score(score)

    conn
    |> put_flash(:info, "Score deleted successfully.")
    |> redirect(to: Routes.score_path(conn, :index))
  end
end
