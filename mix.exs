defmodule EchoBot.Mixfile do
  use Mix.Project

  def project do
    [app: :echo_bot,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A demo telegram bot",
     package: package,
     deps: deps]
  end

  def package do
    [
      maintainers: ["Colin Harris"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/col/echo_bot"}
    ]
  end

  def application do
    [
      applications: [:logger, :nadia, :gproc],
      mod: {EchoBot, []}
    ]
  end

  defp deps do
    [
      {:nadia, git: "https://github.com/col/nadia"},
      {:gproc, "0.5.0"},
      {:poison, "~> 2.0"},
      {:telegram, "~> 0.0.1"}
    ]
  end
end
