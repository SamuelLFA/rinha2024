import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rinha2024, Rinha2024.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "rinha2024_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rinha2024, Rinha2024Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "BtTTs07XkD0GNoSsvvqDoqznxhwLh8dHPEPV1wr9lhAo4BrQ+LfTM5eSFUXE5uPu",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
