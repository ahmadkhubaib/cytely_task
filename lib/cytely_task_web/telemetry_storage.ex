defmodule CytelyTaskWeb.TelemetryStorage do
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  def init(state) do
    {:ok, state}
  end

  def add_data(metric, value) do
    GenServer.cast(__MODULE__, {:add_data, metric, value})
  end

  def get_data(metric) do
    GenServer.call(__MODULE__, {:get_data, metric})
  end

  def handle_cast({:add_data, metric, value}, state) do
    updated_state = Map.update(state, metric, [value], &[value | &1])
    {:noreply, updated_state}
  end

  def handle_call({:get_data, metric}, _from, state) do
    data = Map.get(state, metric, [])
    # Return the latest 10 data points
    {:reply, Enum.take(data, 10), state}
  end
end
