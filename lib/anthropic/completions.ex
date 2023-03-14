defmodule Anthropic.Completions do
  alias Anthropic.Client

  @type create_params :: %{
          required(:prompt) => String.t(),
          required(:model) => String.t(),
          required(:max_tokens_to_sample) => integer(),
          optional(:stop_sequences) => [String.t()],
          optional(:stream) => boolean(),
          optional(:temperature) => float(),
          optional(:top_k) => integer(),
          optional(:top_p) => float()
        }

  @spec create(Client.t(), create_params(), Keyword.t()) :: Client.result()
  def create(client, params, opts \\ []) do
    opts = Client.with_stream_opts(params, opts)

    client
    |> Client.post("/v1/complete", params)
    |> Client.handle_response(opts)
  end
end
