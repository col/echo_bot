use Mix.Config

config :echo_bot, token: (System.get_env("ECHO_BOT_TOKEN") || "")
