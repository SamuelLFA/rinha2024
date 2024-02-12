defmodule Rinha2024.Clients.ClientSchema do
  alias Rinha2024.Clients.TransactionSchema
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: false}
  schema "clients" do
    field :limit,   :integer
    field :balance, :integer

    has_many :transactions, TransactionSchema, foreign_key: :client_id
  end

  def update_balance(client, transaction_value) do
    cast(client, %{balance: client.balance - transaction_value}, [:balance])
    |> validate_balance()
  end

  def validate_balance(changeset) do
    balance = get_field(changeset, :balance)
    limit = get_field(changeset, :limit)

    if balance + limit >= 0 do
      {:ok, changeset}
    else
      {:error, "limit excedeed"}
    end
  end
end
