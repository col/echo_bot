defmodule EchoBot do
  use Application

  def version do
    {:ok, version} = :application.get_key(:echo_bot, :vsn)
    version
  end

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [worker(EchoBot.Worker, [])]
    opts = [strategy: :one_for_one, name: EchoBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
