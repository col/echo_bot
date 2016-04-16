defmodule EchoBot.Mixfile do
  use Mix.Project

  def project do
    [app: :echo_bot,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [
      applications: [:logger, :nadia, :gproc, :edeliver],
      mod: {EchoBot, []}
    ]
  end

  defp deps do
    [
      {:nadia, "~> 0.4"},
      {:gproc, "0.5.0"},
      {:poison, "~> 2.0", override: true},
      {:telegram, git: "https://github.com/col/telegram"}
    ]
  end
end
