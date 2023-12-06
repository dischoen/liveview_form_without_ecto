defmodule DblessForm.Executions.Tseq do
  use Ecto.Schema

  schema "tseqs" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tseq, _attrs) do
    # tseq
    # #Ecto.Changeset<
    #   action: :validate,
    #   changes: %{},
    #   errors: [],
    #   data: %{current1: 0.0, is_good: false, iterations: 100, weather: "windy"},
    #   valid?: true
    # >

    # attrs
    # %{
    #    "_target" => ["formname", "iterations"],
    #    "formname" => %{
    #      "current1" => "10.0",
    #      "is_good" => "false",
    #      "iterations" => "1003",
    #      "weather" => "windy"
    #    }
    # }
    tseq
    # insert dynamic validations here..
  end
end
