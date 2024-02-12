defmodule Rinha2024.Clients do
  import Ecto.Query, warn: false
  alias Rinha2024.Clients.TransactionSchema
  alias Rinha2024.Repo
  alias Rinha2024.Clients.ClientSchema

  def get_client!(id) do
    transactions_query = from t in TransactionSchema, limit: 10
    ClientSchema
    |> preload([transactions: ^transactions_query])
    |> Repo.get!(id)
  end

  def update_balance(client_id, transaction_value) do
    case ClientSchema
      |> Repo.get!(client_id)
      |> ClientSchema.update_balance(transaction_value) do
      {:ok, changeset} -> {:ok, Repo.update!(changeset)}
      {:error, message} -> {:error, message}
    end
  end
end
