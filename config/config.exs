use Mix.Config

config :echo_bot, token: (System.get_env("ECHO_BOT_TOKEN") || "")

config :echo_bot, bot_hub_node: "bot_hub@bothub"

import_config "#{Mix.env}.exs"
