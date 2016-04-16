use Mix.Config

config :nadia, token: (System.get_env("ECHO_BOT_TOKEN") || "")
