defmodule BoomBox.Repo do
  use Ecto.Repo,
    otp_app: :boom_box,
    adapter: Ecto.Adapters.Postgres
end
