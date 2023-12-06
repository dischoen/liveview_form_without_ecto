defmodule DblessFormWeb.TseqLive.FormComponent do
  use DblessFormWeb, :live_component

  alias DblessForm.Executions

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage tseq records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="tseq-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
    <%= for {n,_} <- @form.params do %>
      <%= case @form.source.types[String.to_atom(n)] do %>
        <% :float -> %>
          <.input field={@form[String.to_atom(n)]} type="number" step="any" label={n}/>
        <% :integer -> %>
          <.input field={@form[String.to_atom(n)]} type="number" label={n}/>
        <% :string -> %>
          <.input field={@form[String.to_atom(n)]} type="text" label={n}/>
        <% :boolean -> %>
          <.input field={@form[String.to_atom(n)]} type="checkbox" label={n}/>
      <% end %>
    <% end %>


    <:actions>
          <.button phx-disable-with="Saving...">Save Tseq</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{tseq: tseq} = assigns, socket) do
    IO.inspect {tseq, assigns}, label: :update_in_form
    changeset = Executions.change_tseq(tseq)
    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", wot, socket) do
    changeset =
      socket.assigns.tseq
      |> Executions.change_tseq(wot)
      |> Map.put(:action, :validate)
    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", data, socket) do
    save_tseq(socket, socket.assigns.action, data)
  end

  defp save_tseq(socket, :form, data) do
    notify_parent({:saved, data})
        {:noreply,
         socket
         |> put_flash(:info, "Form done successfully")
         |> push_patch(to: socket.assigns.patch)}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset, as: :formname)
    assign(socket, :form, form)
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
