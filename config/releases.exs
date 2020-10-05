import Config

secret_key_base = System.fetch_env!("SECRET_KEY_BASE")

config :live, LiveWeb.Endpoint,
  url: [host: System.fetch_env!("HTTP_HOST"), port: System.fetch_env!("PORT")],
  cache_static_manifest: "priv/static/cache_manifest.json",
  http: [
    port: String.to_integer(System.fetch_env!("PORT")),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base,
  server: true
