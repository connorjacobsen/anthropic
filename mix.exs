defmodule Anthropic.MixProject do
  use Mix.Project

  @url "https://github.com/connorjacobsen/anthropic"

  def project do
    [
      app: :anthropic,
      version: "0.3.0",
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
      {:castore, "~> 1.0"},
      {:mint, "~> 1.5"},
      {:plug, "~> 1.14", only: :test},
      {:tesla, "~> 1.6"}
    ]
  end
end
