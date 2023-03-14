defmodule Anthropic.ClientTest do
  use Anthropic.Case
  alias Anthropic.Client

  describe "new/1" do
    test "creates a new client from application config" do
      Application.put_env(:anthropic, :api_key, "some-api-key")

      # Does not raise.
      assert _ = Client.new()
    end

    test "raises when missing :api_key" do
      Application.put_env(:anthropic, :api_key, nil)

      assert_raise RuntimeError, "Anthropic client missing :api_key", fn ->
        Client.new([])
      end
    end

    test "sets config from options" do
      Application.put_env(:anthropic, :api_key, nil)

      # Does not raise.
      assert _ = Client.new(api_key: "some-api-key")
    end

    test "raises when missing :api_key with options" do
      Application.put_env(:anthropic, :api_key, nil)

      assert_raise RuntimeError, "Anthropic client missing :api_key", fn ->
        Client.new([])
      end
    end
  end
end
