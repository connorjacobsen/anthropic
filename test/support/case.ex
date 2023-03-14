defmodule Anthropic.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Anthropic.Case
    end
  end

  setup do
    clear_application_env()

    bypass = Bypass.open()
    url = "http://localhost:#{bypass.port}"

    client =
      Anthropic.Client.new(
        base_url: url,
        api_key: "some-api-key"
      )

    {:ok, bypass: bypass, client: client}
  end

  # Completely clears out the application environment for the :anthropic application.
  def clear_application_env do
    Application.put_all_env([{:anthropic, []}])
  end
end
