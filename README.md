# EchoBot

## Deployment

    mix edeliver build release --verbose
    mix edeliver deploy release to production --verbose --version=0.0.x
    mix edeliver start production --verbose

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add echo_bot to your list of dependencies in `mix.exs`:

        def deps do
          [{:echo_bot, "~> 0.0.1"}]
        end

  2. Ensure echo_bot is started before your application:

        def application do
          [applications: [:echo_bot]]
        end
