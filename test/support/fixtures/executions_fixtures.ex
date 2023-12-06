defmodule DblessForm.ExecutionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DblessForm.Executions` context.
  """

  @doc """
  Generate a tseq.
  """
  def tseq_fixture(attrs \\ %{}) do
    {:ok, tseq} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> DblessForm.Executions.create_tseq()

    tseq
  end
end
