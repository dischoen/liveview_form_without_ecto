defmodule DblessForm.Repo.Migrations.CreateBlas do
  use Ecto.Migration

  def change do
    create table(:blas) do
      add :prefix, :string
      add :age, :integer
      add :ratio, :float

      timestamps(type: :utc_datetime)
    end
  end
end
