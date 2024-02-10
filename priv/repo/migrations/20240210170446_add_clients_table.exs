defmodule Rinha2024.Repo.Migrations.AddClients do
  use Ecto.Migration

  def change do
    create table("clients") do
      add :limit,   :integer
      add :balance, :integer, default: 0
    end
  end
end
