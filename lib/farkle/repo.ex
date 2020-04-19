defmodule Farkle.Repo do
  use Ecto.Repo,
    otp_app: :farkle,
    adapter: Ecto.Adapters.Postgres
end
