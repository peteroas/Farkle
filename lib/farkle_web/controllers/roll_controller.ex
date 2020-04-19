defmodule FarkleWeb.RollController do
  use FarkleWeb, :controller

  alias Farkle.Players
  alias Farkle.Players.Roll

  def index(conn, _params) do
    rolls = Players.list_rolls()
    render(conn, "index.html", rolls: rolls)
  end

  def new(conn, _params) do
    changeset = Players.change_roll(%Roll{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"roll" => roll_params}) do
    case Players.create_roll(roll_params) do
      {:ok, roll} ->
        conn
        |> put_flash(:info, "Roll created successfully.")
        |> redirect(to: Routes.roll_path(conn, :show, roll))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    roll = Players.get_roll!(id)
    render(conn, "show.html", roll: roll)
  end

  def edit(conn, %{"id" => id}) do
    roll = Players.get_roll!(id)
    changeset = Players.change_roll(roll)
    render(conn, "edit.html", roll: roll, changeset: changeset)
  end

  def update(conn, %{"id" => id, "roll" => roll_params}) do
    roll = Players.get_roll!(id)

    case Players.update_roll(roll, roll_params) do
      {:ok, roll} ->
        conn
        |> put_flash(:info, "Roll updated successfully.")
        |> redirect(to: Routes.roll_path(conn, :show, roll))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", roll: roll, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    roll = Players.get_roll!(id)
    {:ok, _roll} = Players.delete_roll(roll)

    conn
    |> put_flash(:info, "Roll deleted successfully.")
    |> redirect(to: Routes.roll_path(conn, :index))
  end
end
