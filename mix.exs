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

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :nadia, :gproc, :edeliver],
      mod: {EchoBot, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:nadia, "~> 0.4"},
      {:gproc, "0.5.0"},
      {:poison, "~> 2.0", override: true},
      {:telegram, git: "https://github.com/col/telegram"},
      # {:exrm, "~> 1.0.3"},
      {:edeliver, "~> 1.1.5"}
    ]
  end
end
