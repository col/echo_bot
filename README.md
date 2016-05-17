# EchoBot

## Start Local

    iex --name "echo_bot@127.0.0.1" -S mix

## Deployment

    mix edeliver build release
    mix edeliver deploy release to production --version=0.0.x
    mix edeliver start production

## Upgrade

  mix edeliver build upgrade --from=0.0.x --to=0.0.z
  mix edeliver deploy upgrade to production --version=0.0.z

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
