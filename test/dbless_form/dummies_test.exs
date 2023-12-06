defmodule DblessForm.DummiesTest do
  use DblessForm.DataCase

  alias DblessForm.Dummies

  describe "blas" do
    alias DblessForm.Dummies.Bla

    import DblessForm.DummiesFixtures

    @invalid_attrs %{age: nil, prefix: nil, ratio: nil}

    test "list_blas/0 returns all blas" do
      bla = bla_fixture()
      assert Dummies.list_blas() == [bla]
    end

    test "get_bla!/1 returns the bla with given id" do
      bla = bla_fixture()
      assert Dummies.get_bla!(bla.id) == bla
    end

    test "create_bla/1 with valid data creates a bla" do
      valid_attrs = %{age: 42, prefix: "some prefix", ratio: 120.5}

      assert {:ok, %Bla{} = bla} = Dummies.create_bla(valid_attrs)
      assert bla.age == 42
      assert bla.prefix == "some prefix"
      assert bla.ratio == 120.5
    end

    test "create_bla/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dummies.create_bla(@invalid_attrs)
    end

    test "update_bla/2 with valid data updates the bla" do
      bla = bla_fixture()
      update_attrs = %{age: 43, prefix: "some updated prefix", ratio: 456.7}

      assert {:ok, %Bla{} = bla} = Dummies.update_bla(bla, update_attrs)
      assert bla.age == 43
      assert bla.prefix == "some updated prefix"
      assert bla.ratio == 456.7
    end

    test "update_bla/2 with invalid data returns error changeset" do
      bla = bla_fixture()
      assert {:error, %Ecto.Changeset{}} = Dummies.update_bla(bla, @invalid_attrs)
      assert bla == Dummies.get_bla!(bla.id)
    end

    test "delete_bla/1 deletes the bla" do
      bla = bla_fixture()
      assert {:ok, %Bla{}} = Dummies.delete_bla(bla)
      assert_raise Ecto.NoResultsError, fn -> Dummies.get_bla!(bla.id) end
    end

    test "change_bla/1 returns a bla changeset" do
      bla = bla_fixture()
      assert %Ecto.Changeset{} = Dummies.change_bla(bla)
    end
  end
end
