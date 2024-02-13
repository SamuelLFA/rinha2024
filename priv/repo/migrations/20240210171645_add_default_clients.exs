defmodule Rinha2024.Repo.Migrations.AddDefaultClients do
  use Ecto.Migration

  def up do
    execute "
    INSERT INTO clients(
      id,
      \"limit\"
    )
    VALUES
      (1, 100000),
      (2, 80000),
      (3, 1000000),
      (4, 10000000),
      (5, 500000);
    "
  end

  def down do
    execute "DELETE FROM clients;"
  end
end
