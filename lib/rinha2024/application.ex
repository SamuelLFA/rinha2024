defmodule Rinha2024.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Rinha2024Web.Telemetry,
      Rinha2024.Repo,
      {DNSCluster, query: Application.get_env(:rinha2024, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Rinha2024.PubSub},
      # Start a worker by calling: Rinha2024.Worker.start_link(arg)
      # {Rinha2024.Worker, arg},
      # Start to serve requests, typically the last entry
      Rinha2024Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rinha2024.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Rinha2024Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
