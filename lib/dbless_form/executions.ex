defmodule DblessForm.Executions do
  @moduledoc """
  The Executions context.
  """

  import Ecto.Query, warn: false
  alias DblessForm.Repo

  alias DblessForm.Executions.Tseq

  @doc """
  Returns the list of tseqs.

  ## Examples

      iex> list_tseqs()
      [%Tseq{}, ...]

  """
  def list_tseqs do
    Repo.all(Tseq)
  end

  @doc """
  Gets a single tseq.

  Raises `Ecto.NoResultsError` if the Tseq does not exist.

  ## Examples

      iex> get_tseq!(123)
      %Tseq{}

      iex> get_tseq!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tseq!(id), do: Repo.get!(Tseq, id)

  @doc """
  Creates a tseq.

  ## Examples

      iex> create_tseq(%{field: value})
      {:ok, %Tseq{}}

      iex> create_tseq(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tseq(attrs \\ %{}) do
    %Tseq{}
    |> Tseq.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tseq.

  ## Examples

      iex> update_tseq(tseq, %{field: new_value})
      {:ok, %Tseq{}}

      iex> update_tseq(tseq, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tseq(%Tseq{} = tseq, attrs) do
    tseq
    |> Tseq.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tseq.

  ## Examples

      iex> delete_tseq(tseq)
      {:ok, %Tseq{}}

      iex> delete_tseq(tseq)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tseq(%Tseq{} = tseq) do
    Repo.delete(tseq)
  end

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
