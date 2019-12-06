defmodule Eventmanager.Repo do
  use Ecto.Repo,
    otp_app: :eventmanager,
    adapter: Ecto.Adapters.Postgres
end
