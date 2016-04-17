defmodule EchoBot.Worker do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, "EchoBot")
  end

  def handle_message(pid, message) do
    GenServer.cast(pid, {:handle_message, message})
  end

  def init(name) do
    connect_to_hub
    :global.register_name(name, self)
    {:ok, []}
  end

  def connect_to_hub do
    node_name = Application.get_env(:echo_bot, :bot_hub_node)
    result = Node.connect String.to_atom(node_name)
    IO.puts "Connecting to bot_hub (#{node_name}): #{result}"
  end

  def token, do: Application.get_env(:echo_bot, :token)

  def handle_cast({:handle_message, json}, state) do
    message = Telegram.Request.parse(json).message
    Nadia.send_message(message.chat.id, message.text, token: token)
    {:noreply, state}
  end

end
