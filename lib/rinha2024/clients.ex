defmodule Rinha2024.Clients do
  import Ecto.Query, warn: false
  alias Rinha2024.Repo
  alias Rinha2024.Clients.ClientSchema

  def get_client!(id), do:
    ClientSchema
    |> preload(:transactions)
    |> Repo.get!(id)
end
