defmodule Rinha2024Web.ClientController do
  alias Rinha2024.Clients.TransactionSchema
  alias Rinha2024.Transaction
  alias Rinha2024.Clients
  use Rinha2024Web, :controller

  def bank_statement(conn, %{"id" => id}) do
    try do
      client = Clients.get_client!(id)
      render(conn, :statement, client: client)

    rescue
      Ecto.NoResultsError -> conn
      |> put_status(:not_found)
      |> render(:not_found, id: id)
    end
  end

  @spec add_transaction(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def add_transaction(conn, %{"id" => client_id}) do
    body = %{
      value: Map.fetch!(conn.params, "valor"),
      type: Map.fetch!(conn.params, "tipo"),
      description: Map.fetch!(conn.params, "descricao")
    }

    with {:ok, %TransactionSchema{} = transaction} <- Transaction.add_transaction(body, client_id) do
      conn
      |> put_status(:ok)
      |> render(:transaction, client: transaction.client)
    else
      {:error, message} when is_bitstring(message) ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:unprocessable_entity)

      {:error, changeset} ->
        conn
        |> put_status(:bad_request)
        |> render(:bad_request, changeset: changeset)
    end
  end
end
