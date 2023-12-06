defmodule DblessForm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DblessFormWeb.Telemetry,
      DblessForm.Repo,
      {DNSCluster, query: Application.get_env(:dbless_form, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DblessForm.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: DblessForm.Finch},
      # Start a worker by calling: DblessForm.Worker.start_link(arg)
      # {DblessForm.Worker, arg},
      # Start to serve requests, typically the last entry
      DblessFormWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DblessForm.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DblessFormWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end