defmodule Scrivener.Headers.Mixfile do
  use Mix.Project

  @source_url "https://github.com/beam-community/scrivener_headers"

  def project do
    [
      app: :scrivener_headers,
      version: version(),
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
      files: ["lib", "mix.exs", "README*", "LICENSE*", "VERSION"],
      licenses: ["MIT"],
      links: %{
        GitHub: @source_url
      }
    ]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [
      {:plug, "~> 1.12", optional: true},
      {:scrivener, "~> 2.7"},
      {:credo, "~> 1.5", only: [:dev, :test]},
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

  defp version do
    "VERSION"
    |> File.read!()
    |> String.trim()
  end
end
