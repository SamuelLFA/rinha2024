defmodule Rinha2024.Clients.TransactionSchema do
  alias Rinha2024.Clients.ClientSchema
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: false}
  schema "transactions" do
    field :value, :integer
    field :type, :string
    field :description, :string
    field :created_at, :utc_datetime_usec

    belongs_to :client, ClientSchema
  end

  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:value, :type, :description])
    |> validate_required([:value, :type, :description])
    |> validate_inclusion(:type, ["c", "d"])
    |> validate_length(:description, min: 1, max: 10)
  end
end
