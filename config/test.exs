import Config
# Only in tests, remove the complexity from the password hashing algorithm
config :pbkdf2_elixir, :rounds, 1

# Option 1: Load and export to system environment
# Dotenvy.source!("/path/to/.env")
# Configure your database
# System.get_env("POSTGRES_PASSWORD")
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :learning_phoenix, LearningPhoenix.Repo,
  username: "postgres",
  password: "postgres",

  # config[:POSTGRES_PASSWORD]
  hostname: "localhost",
  database: "learning_phoenix_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :learning_phoenix, LearningPhoenixWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ezX+F/4Y6FAVU6oxKC0dk3N+GrRGeaLcg5AmuZ69qeldeZjmTz4VdnxbLImMaFiC",
  server: false

# In test we don't send emails
config :learning_phoenix, LearningPhoenix.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
