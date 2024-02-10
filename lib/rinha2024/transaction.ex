defmodule Rinha2024.Transaction do
  import Ecto.Query, warn: false
  alias Rinha2024.Clients.TransactionSchema
  alias Rinha2024.Repo
  alias Rinha2024.Clients.ClientSchema

  def add_transaction(attrs, client_id) do
    client = ClientSchema
    |> Repo.get!(client_id)

    %TransactionSchema{client: client}
    |> TransactionSchema.changeset(attrs)
    |> Repo.insert()
  end
end
