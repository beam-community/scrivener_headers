defmodule Scrivener.Headers.Mixfile do
  use Mix.Project

  @source_url "https://github.com/beam-community/scrivener_headers"

  def project do
    [
      app: :scrivener_headers,
      version: "3.1.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def package do
    [
      description: "Helpers for paginating API responses with Scrivener and HTTP headers",
      maintainers: ["Sean Callan"],
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{
        GitHub: @source_url
      }
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.12"},
      {:scrivener, "~> 2.7"},

      # Dev & Test Dependencies
      {:credo, "~> 1.5", only: [:dev, :test]},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      formatters: ["html"]
    ]
  end
end
