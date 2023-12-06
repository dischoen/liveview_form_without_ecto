defmodule DblessForm.ExecutionsTest do
  use DblessForm.DataCase

  alias DblessForm.Executions

  describe "tseqs" do
    alias DblessForm.Executions.Tseq

    import DblessForm.ExecutionsFixtures

    @invalid_attrs %{name: nil}

    test "list_tseqs/0 returns all tseqs" do
      tseq = tseq_fixture()
      assert Executions.list_tseqs() == [tseq]
    end

    test "get_tseq!/1 returns the tseq with given id" do
      tseq = tseq_fixture()
      assert Executions.get_tseq!(tseq.id) == tseq
    end

    test "create_tseq/1 with valid data creates a tseq" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Tseq{} = tseq} = Executions.create_tseq(valid_attrs)
      assert tseq.name == "some name"
    end

    test "create_tseq/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Executions.create_tseq(@invalid_attrs)
    end

    test "update_tseq/2 with valid data updates the tseq" do
      tseq = tseq_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Tseq{} = tseq} = Executions.update_tseq(tseq, update_attrs)
      assert tseq.name == "some updated name"
    end

    test "update_tseq/2 with invalid data returns error changeset" do
      tseq = tseq_fixture()
      assert {:error, %Ecto.Changeset{}} = Executions.update_tseq(tseq, @invalid_attrs)
      assert tseq == Executions.get_tseq!(tseq.id)
    end

    test "delete_tseq/1 deletes the tseq" do
      tseq = tseq_fixture()
      assert {:ok, %Tseq{}} = Executions.delete_tseq(tseq)
      assert_raise Ecto.NoResultsError, fn -> Executions.get_tseq!(tseq.id) end
    end

    test "change_tseq/1 returns a tseq changeset" do
      tseq = tseq_fixture()
      assert %Ecto.Changeset{} = Executions.change_tseq(tseq)
    end
  end
end
