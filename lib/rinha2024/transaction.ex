defmodule Rinha2024.Transaction do
  import Ecto.Query, warn: false
  alias Rinha2024.Clients.TransactionSchema
  alias Rinha2024.Repo
  alias Rinha2024.Clients

  def add_transaction(attrs, client_id) do
    case Clients.update_balance(client_id, attrs.value) do
      {:ok, client} ->
        %TransactionSchema{client: client}
        |> TransactionSchema.changeset(attrs)
        |> Repo.insert()

      {:error, message} -> {:error, message}
    end
  end
end
