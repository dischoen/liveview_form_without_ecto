defmodule DblessFormWeb.BlaLiveTest do
  use DblessFormWeb.ConnCase

  import Phoenix.LiveViewTest
  import DblessForm.DummiesFixtures

  @create_attrs %{age: 42, prefix: "some prefix", ratio: 120.5}
  @update_attrs %{age: 43, prefix: "some updated prefix", ratio: 456.7}
  @invalid_attrs %{age: nil, prefix: nil, ratio: nil}

  defp create_bla(_) do
    bla = bla_fixture()
    %{bla: bla}
  end

  describe "Index" do
    setup [:create_bla]

    test "lists all blas", %{conn: conn, bla: bla} do
      {:ok, _index_live, html} = live(conn, ~p"/blas")

      assert html =~ "Listing Blas"
      assert html =~ bla.prefix
    end

    test "saves new bla", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/blas")

      assert index_live |> element("a", "New Bla") |> render_click() =~
               "New Bla"

      assert_patch(index_live, ~p"/blas/new")

      assert index_live
             |> form("#bla-form", bla: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#bla-form", bla: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/blas")

      html = render(index_live)
      assert html =~ "Bla created successfully"
      assert html =~ "some prefix"
    end

    test "updates bla in listing", %{conn: conn, bla: bla} do
      {:ok, index_live, _html} = live(conn, ~p"/blas")

      assert index_live |> element("#blas-#{bla.id} a", "Edit") |> render_click() =~
               "Edit Bla"

      assert_patch(index_live, ~p"/blas/#{bla}/edit")

      assert index_live
             |> form("#bla-form", bla: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#bla-form", bla: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/blas")

      html = render(index_live)
      assert html =~ "Bla updated successfully"
      assert html =~ "some updated prefix"
    end

    test "deletes bla in listing", %{conn: conn, bla: bla} do
      {:ok, index_live, _html} = live(conn, ~p"/blas")

      assert index_live |> element("#blas-#{bla.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#blas-#{bla.id}")
    end
  end

  describe "Show" do
    setup [:create_bla]

    test "displays bla", %{conn: conn, bla: bla} do
      {:ok, _show_live, html} = live(conn, ~p"/blas/#{bla}")

      assert html =~ "Show Bla"
      assert html =~ bla.prefix
    end

    test "updates bla within modal", %{conn: conn, bla: bla} do
      {:ok, show_live, _html} = live(conn, ~p"/blas/#{bla}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Bla"

      assert_patch(show_live, ~p"/blas/#{bla}/show/edit")

      assert show_live
             |> form("#bla-form", bla: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#bla-form", bla: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/blas/#{bla}")

      html = render(show_live)
      assert html =~ "Bla updated successfully"
      assert html =~ "some updated prefix"
    end
  end
end
