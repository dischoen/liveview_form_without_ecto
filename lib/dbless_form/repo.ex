defmodule DblessForm.Repo do
  use Ecto.Repo,
    otp_app: :dbless_form,
    adapter: Ecto.Adapters.Postgres
end
