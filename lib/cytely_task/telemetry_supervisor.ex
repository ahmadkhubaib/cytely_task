defmodule CytelyTask.TelemetrySupervisor do
  use Supervisor

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_initial_args) do
    children = [
      {CytelyTaskWeb.TelemetryStorage, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
