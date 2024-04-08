defmodule Anthropic.Messages do
  alias Anthropic.Client

  @type message :: %{
          required(:role) => String.t(),
          required(:content) => String.t()
        }

  @type tool :: %{
          required(:name) => String.t(),
          optional(:description) => String.t(),
          required(:input_schema) => map()
        }

  @type create_params :: %{
          required(:model) => String.t(),
          required(:messages) => [message()],
          required(:max_tokens) => pos_integer(),
          optional(:metadata) => map(),
          optional(:stop_sequences) => [String.t()],
          optional(:stream) => boolean(),
          optional(:system) => String.t(),
          optional(:temperature) => float(),
          optional(:tools) => [tool()],
          optional(:top_k) => pos_integer(),
          optional(:top_p) => float()
        }

  @spec create(Client.client(), create_params(), Keyword.t()) :: Client.result()
  def create(client, params, opts \\ []) do
    opts = Client.with_stream_opts(params, opts)

    client
    |> Client.post("/v1/messages", params)
    |> Client.handle_response(opts)
  end
end
