defmodule Anthropic.MixProject do
  use Mix.Project

  @url "https://github.com/connorjacobsen/anthropic"

  def project do
    [
      app: :anthropic,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      description: "Elixir client for Anthropic API",
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Connor Jacobsen"],
      licenses: ["MIT"],
      links: %{"GitHub" => @url, "Source" => @url}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:bypass, "~> 2.1", only: :test},
      {:jason, "~> 1.4"},
      {:hackney, "~> 1.10"},
      {:plug, "~> 1.14", only: :test},
      {:tesla, github: "connorjacobsen/tesla", ref: "1d2e7999f3a0894652fab88512c25db3a917a70f"}
    ]
  end
end
