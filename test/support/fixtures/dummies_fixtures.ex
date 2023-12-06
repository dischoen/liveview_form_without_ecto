defmodule DblessForm.DummiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DblessForm.Dummies` context.
  """

  @doc """
  Generate a bla.
  """
  def bla_fixture(attrs \\ %{}) do
    {:ok, bla} =
      attrs
      |> Enum.into(%{
        age: 42,
        prefix: "some prefix",
        ratio: 120.5
      })
      |> DblessForm.Dummies.create_bla()

    bla
  end
end
