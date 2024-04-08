defmodule Anthropic.MessagesTest do
  use Anthropic.Case
  alias Anthropic.Messages

  @model "claude-3-opus-20240229"
  @create_messages_response %{
    "id" => "msg_01XFDUDYJgAACzvnptvVoYEL",
    "type" => "message",
    "role" => "assistant",
    "content" => [
      %{
        "type" => "text",
        "text" => "Hello!"
      }
    ],
    "model" => "claude-2.1",
    "stop_reason" => "end_turn",
    "stop_sequence" => nil,
    "usage" => %{
      "input_tokens" => 12,
      "output_tokens" => 6
    }
  }

  describe "create/3" do
    test "returns a messages response", %{bypass: bypass, client: client} do
      Bypass.expect_once(bypass, "POST", "/v1/messages", fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, Jason.encode!(@create_messages_response))
      end)

      {:ok, resp} =
        Messages.create(client, %{
          model: @model,
          messages: [%{role: "user", content: "Hello, Claude"}],
          max_tokens: 1024
        })

      assert resp == @create_messages_response
    end
  end
end
