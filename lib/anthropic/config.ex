defmodule Anthropic.Config do
  @moduledoc false

  @app_name :anthropic

  @doc false
  def get(opts, key, default \\ nil) do
    Keyword.get(opts, key, get_env(key, default))
  end

  defp get_env(key, default) do
    Application.get_env(@app_name, key, default)
  end
end
