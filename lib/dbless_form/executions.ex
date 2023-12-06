defmodule DblessForm.Executions do
  @moduledoc """
  The Executions context.
  """

  import Ecto.Query, warn: false

  alias DblessForm.Executions.Tseq

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tseq changes.

  ## Examples

      iex> change_tseq(tseq)
      %Ecto.Changeset{data: %Tseq{}}

  """
  def change_tseq(tseq, attrs \\ %{}) do
    Tseq.changeset(tseq, attrs)
  end
end
