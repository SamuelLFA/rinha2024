defmodule Rinha2024.Clients.ClientSchema do
  alias Rinha2024.Clients.TransactionSchema
  use Ecto.Schema

  @primary_key {:id, :id, autogenerate: false}
  schema "clients" do
    field :limit,   :integer
    field :balance, :integer

    has_many :transactions, TransactionSchema, foreign_key: :client_id
  end
end
