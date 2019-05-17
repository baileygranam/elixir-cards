defmodule Cards.MixProject do
  use Mix.Project

  def project do
    [
      app: :playing_cards,
      name: "Cards",
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      source_url: "https://github.com/baileygranam/elixir-cards"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    "A module that provides functions for creating and dealing playing cards."
  end

  defp package() do
    [
      name: "playing_cards",
      # These are the default files included in the package
      files: ~w(lib config test doc .formatter.exs mix.exs README.md),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/baileygranam/elixir-cards"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
    ]
  end
end
