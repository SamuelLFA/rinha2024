defmodule Rinha2024.Repo.Migrations.AddDefaultClients do
  use Ecto.Migration

  def up do
    execute "
    INSERT INTO clients(
      id,
      \"limit\"
    )
    VALUES
      (1, 1000000),
      (2, 800000),
      (3, 10000000),
      (4, 100000000),
      (5, 5000000);
    "
  end

  def down do
    execute "DELETE FROM clients;"
  end
end
