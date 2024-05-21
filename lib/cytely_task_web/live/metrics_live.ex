defmodule CytelyTaskWeb.MetricsLive do
  use CytelyTaskWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col flex-1 overflow-y-auto">
      <div class="p-4">
      <div id="PlotlyHooks" phx-hook="PlotlyHooks"><!-- Plotly chart will be drawn inside this DIV --></div>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
    {:ok, assign(socket, data: [], categories: [])}
  end

  def handle_info(:tick, socket) do
    data = fetch_telemetry_data()
    categories = Enum.map(1..length(data), &Integer.to_string/1)

    {:noreply,
     assign(socket, data: data, categories: categories)
     |> push_event("PlotlyHooks", %{data: data, categories: categories})}
  end

  def fetch_telemetry_data do
    CytelyTaskWeb.TelemetryStorage.get_data(:request_duration)
  end

  def handle_params(_param, _session, socket) do
    {:noreply, socket}
  end
end
