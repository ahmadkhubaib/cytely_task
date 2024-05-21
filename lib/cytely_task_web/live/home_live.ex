defmodule CytelyTaskWeb.HomeLive do
  use CytelyTaskWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col flex-1 overflow-y-auto">
      <div class="p-4">
        <h1 class="text-2xl font-bold">Welcome to my dashboard!</h1>
        <p class="mt-2 text-gray-600">This is an example dashboard using Tailwind CSS.</p>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
