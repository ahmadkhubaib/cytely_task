defmodule CytelyTask.Repo do
  use Ecto.Repo,
    otp_app: :cytely_task,
    adapter: Ecto.Adapters.Postgres
end
