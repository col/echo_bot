defmodule EchoBot.Worker do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, "EchoBot")
  end

  def handle_message(pid, message) do
    GenServer.cast(pid, {:handle_message, message})
  end

  def init(name) do
    :gproc.reg({:n, :l, {:bot, name}})
    {:ok, []}
  end

  def token do: Application.get_env(:echo_bot, :token)

  def handle_cast({:handle_message, message}, state) do
    request = Telegram.Request.parse(message)
    Nadia.send_message(request.chat.id, request.text, token: token)
    {:noreply, state}
  end

end
