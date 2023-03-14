# Anthropic

Elixir client for the Anthropic API.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `anthropic` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:anthropic, github: "connorjacobsen/anthropic"}
  ]
end
```

Note: This library relies on a fork of the [Tesla](https://github.com/elixir-tesla/tesla) HTTP client to support response streaming. The fork will be removed once it is supported in the main Tesla library.

## Configuration

You can configure the client via `config.exs`:

```elixir
config :anthropic, api_key: "your-api-key",
```

You can also specify the configuration options directly when initially a client. This will override any global config options.


```elixir
Anthropic.Client.new(api_key: "your-api-key")
```

## Completions

```elixir
{:ok, data} = Anthropic.Completions.create(client, %{
  prompt: "\n\nWhy is the sky blue?\n\nAssistant:",
  model: "claude-v1",
  max_tokens_to_sample: 500
})
```
