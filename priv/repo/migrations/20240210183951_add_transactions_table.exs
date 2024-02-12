defmodule Rinha2024.Repo.Migrations.AddTransactionsTable do
  use Ecto.Migration

  def change do
    create table("transactions") do
      add :value, :integer
      add :type, :string, size: 1
      add :description, :string, size: 10
      add :created_at, :utc_datetime_usec, default: fragment("now()")

      add :client_id, references("clients")
    end
  end
end
