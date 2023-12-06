defmodule DblessFormWeb.TseqLive.Index do
  use DblessFormWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp form_definition() do
    form_data = %{"current1"   => %{:value => 0.0,     :type => :float},
                  "iterations" => %{:value => 100,     :type => :integer},
                  "is_good"    => %{:value => :false,  :type => :boolean},
                  "weather"    => %{:value => "windy", :type => :string}}
    
    params = Map.new(Enum.map(form_data, fn({k,v}) -> {String.to_atom(k), v.value} end))
    types = Map.new(Enum.map(form_data, fn({k,v}) -> {String.to_atom(k), v.type} end))
    changeset =
    {params, types}
    |> Ecto.Changeset.cast(params, Map.keys(types))
    
    changeset = %{changeset | action: :validate}
    Map.put(changeset, :id, "form-id")
  end
  
  defp apply_action(socket, :form, _params) do
     socket
    |> assign(:page_title, "Some title")
    |> assign(:tseq, form_definition())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Start here")
    |> assign(:tseq, nil)
  end

  @impl true
  def handle_info({DblessFormWeb.TseqLive.FormComponent, {:saved, data}}, socket) do
    # return from form. do something with the input data.
    IO.inspect data
    
    {:noreply, socket}
  end
end
