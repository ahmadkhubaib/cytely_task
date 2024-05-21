defmodule CytelyTask.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CytelyTaskWeb.Telemetry,
      CytelyTask.Repo,
      {DNSCluster, query: Application.get_env(:cytely_task, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CytelyTask.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CytelyTask.Finch},
      # Start a worker by calling: CytelyTask.Worker.start_link(arg)
      # {CytelyTask.Worker, arg},
      # Start to serve requests, typically the last entry
      CytelyTaskWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CytelyTask.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CytelyTaskWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
