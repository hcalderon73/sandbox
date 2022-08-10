import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sandbox, SandboxWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "L9Vsv6cn7CtEs69gtLtQ2F4uafV8RnBRlprpFwiEiu1f5Dlp75RBRWkfLZpS3JlK",
  server: false

# In test we don't send emails.
config :sandbox, Sandbox.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
