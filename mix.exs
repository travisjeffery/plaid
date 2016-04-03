defmodule Plaid.Mixfile do
  use Mix.Project

  def project do
    [app: :plaid,
     version: "0.0.1",
     elixir: "~> 1.2",
     description: "Client for Plaid, the finance API.",
     package: package,     
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:poison, "~> 2.0"}
    ]
  end

  defp package do
    [
      files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
      maintainers: ["Travis Jeffery"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/travisjeffery/plaid"}
    ]
  end
end
