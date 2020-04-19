defmodule FarkleWeb.RollControllerTest do
  use FarkleWeb.ConnCase

  alias Farkle.Players

  @create_attrs %{locked?: true, number: 42}
  @update_attrs %{locked?: false, number: 43}
  @invalid_attrs %{locked?: nil, number: nil}

  def fixture(:roll) do
    {:ok, roll} = Players.create_roll(@create_attrs)
    roll
  end

  describe "index" do
    test "lists all rolls", %{conn: conn} do
      conn = get(conn, Routes.roll_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Rolls"
    end
  end

  describe "new roll" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.roll_path(conn, :new))
      assert html_response(conn, 200) =~ "New Roll"
    end
  end

  describe "create roll" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.roll_path(conn, :create), roll: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.roll_path(conn, :show, id)

      conn = get(conn, Routes.roll_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Roll"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.roll_path(conn, :create), roll: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Roll"
    end
  end

  describe "edit roll" do
    setup [:create_roll]

    test "renders form for editing chosen roll", %{conn: conn, roll: roll} do
      conn = get(conn, Routes.roll_path(conn, :edit, roll))
      assert html_response(conn, 200) =~ "Edit Roll"
    end
  end

  describe "update roll" do
    setup [:create_roll]

    test "redirects when data is valid", %{conn: conn, roll: roll} do
      conn = put(conn, Routes.roll_path(conn, :update, roll), roll: @update_attrs)
      assert redirected_to(conn) == Routes.roll_path(conn, :show, roll)

      conn = get(conn, Routes.roll_path(conn, :show, roll))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, roll: roll} do
      conn = put(conn, Routes.roll_path(conn, :update, roll), roll: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Roll"
    end
  end

  describe "delete roll" do
    setup [:create_roll]

    test "deletes chosen roll", %{conn: conn, roll: roll} do
      conn = delete(conn, Routes.roll_path(conn, :delete, roll))
      assert redirected_to(conn) == Routes.roll_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.roll_path(conn, :show, roll))
      end
    end
  end

  defp create_roll(_) do
    roll = fixture(:roll)
    {:ok, roll: roll}
  end
end
