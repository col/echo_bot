defmodule EchoBotTest do
  use ExUnit.Case
  doctest EchoBot

  setup do
    pid = :global.whereis_name("EchoBot")
    {:ok, pid: pid}
  end

  test "echos the message", %{pid: pid} do
    request_body = %Telegram.Request{
      message: %Telegram.Message{
        chat: %Telegram.Chat{ id: 123 },
        text: "hello"
      }
    } |> Telegram.Request.encode
    EchoBot.Worker.handle_message(pid, request_body)
    # TODO: This is not really testing anything.
    # TODO: Need to assert that a message has been sent to the chat group!
  end

end
