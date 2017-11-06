defmodule CountryData.Mixfile do
  use Mix.Project
  @version File.cwd!() |> Path.join("version") |> File.read!() |> String.trim()

  def project do
    [
      app: :country_data,
      version: @version,
      elixir: "~> 1.5",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),

      # exdocs
      # Docs
      name: "CountryData",
      source_url: "https://github.com/tubitv/ex_country_data",
      homepage_url: "https://github.com/tubitv/ex_country_data",
      docs: [
        main: "CountryData",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CountryData.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: elixirc_paths(:test)
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:poison, "~> 3.0"},

      # dev & test
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:ex_doc, "~> 0.18.1", only: [:dev, :test]},
      {:pre_commit_hook, "~> 1.0.6", only: [:dev]}
    ]
  end

  defp description do
    """
    The country, language & currency utility functions inspired by https://github.com/OpenBookPrices/country-data/.
    """
  end

  defp package do
    [
      files: ["config", "lib", "priv", "mix.exs", "README*", "LICENSE*", "version"],
      licenses: ["MIT"],
      maintainers: ["tyr.chen@gmail.com"],
      links: %{
        "GitHub" => "https://github.com/tubitv/ex_country_data",
        "Docs" => "http://tubitv.github.io/ex_country_data/"
      }
    ]
  end
end
