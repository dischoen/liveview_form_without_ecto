defmodule DblessFormWeb.TseqLiveTest do
  use DblessFormWeb.ConnCase

  import Phoenix.LiveViewTest
  import DblessForm.ExecutionsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_tseq(_) do
    tseq = tseq_fixture()
    %{tseq: tseq}
  end

  describe "Index" do
    setup [:create_tseq]

    test "lists all tseqs", %{conn: conn, tseq: tseq} do
      {:ok, _index_live, html} = live(conn, ~p"/tseqs")

      assert html =~ "Listing Tseqs"
      assert html =~ tseq.name
    end

    test "saves new tseq", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/tseqs")

      assert index_live |> element("a", "New Tseq") |> render_click() =~
               "New Tseq"

      assert_patch(index_live, ~p"/tseqs/new")

      assert index_live
             |> form("#tseq-form", tseq: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#tseq-form", tseq: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tseqs")

      html = render(index_live)
      assert html =~ "Tseq created successfully"
      assert html =~ "some name"
    end

    test "updates tseq in listing", %{conn: conn, tseq: tseq} do
      {:ok, index_live, _html} = live(conn, ~p"/tseqs")

      assert index_live |> element("#tseqs-#{tseq.id} a", "Edit") |> render_click() =~
               "Edit Tseq"

      assert_patch(index_live, ~p"/tseqs/#{tseq}/edit")

      assert index_live
             |> form("#tseq-form", tseq: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#tseq-form", tseq: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tseqs")

      html = render(index_live)
      assert html =~ "Tseq updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes tseq in listing", %{conn: conn, tseq: tseq} do
      {:ok, index_live, _html} = live(conn, ~p"/tseqs")

      assert index_live |> element("#tseqs-#{tseq.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#tseqs-#{tseq.id}")
    end
  end

  describe "Show" do
    setup [:create_tseq]

    test "displays tseq", %{conn: conn, tseq: tseq} do
      {:ok, _show_live, html} = live(conn, ~p"/tseqs/#{tseq}")

      assert html =~ "Show Tseq"
      assert html =~ tseq.name
    end

    test "updates tseq within modal", %{conn: conn, tseq: tseq} do
      {:ok, show_live, _html} = live(conn, ~p"/tseqs/#{tseq}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Tseq"

      assert_patch(show_live, ~p"/tseqs/#{tseq}/show/edit")

      assert show_live
             |> form("#tseq-form", tseq: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#tseq-form", tseq: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/tseqs/#{tseq}")

      html = render(show_live)
      assert html =~ "Tseq updated successfully"
      assert html =~ "some updated name"
    end
  end
end
