defmodule CountryData do
  @moduledoc """
  The country, language & currency utility functions.

  Usage:

  1) retrieve all country data

    iex> [country | _rest] = CountryData.all_countries()
    iex> country["alpha2"]
    "AC"

  You can also retrieve all languages, all currencies, all regions.

  2) search by certain fields

    iex> [us] = CountryData.search_countries_by_alpha2("US")
    iex> us["name"]
    "United States"

    iex> [cn] = CountryData.search_countries_by_name("Canada")
    iex> cn["alpha3"]
    "CAN"

    iex> countries = CountryData.search_countries_by_currencies("EUR")
    iex> length(countries)
    41

    iex> [russian] = CountryData.search_languages_by_name("Russian")
    iex> russian
    %{"alpha2" => "ru", "alpha3" => "rus", "bibliographic" => "", "name" => "Russian"}

    iex> [jpy] = CountryData.search_currencies_by_code("JPY")
    iex> jpy
    %{"code" => "JPY", "decimals" => 0, "name" => "Japanese yen", "number" => "392"}

    iex> [nor] = CountryData.search_regions_by_name("Northern America")
    iex> nor["countries"]
    ["BM", "CA", "GL", "MX", "PM", "US"]

  There are more utility functions for use. See docs for further information.

  """

  alias CountryData.Server

  :country_data
  |> Application.get_env(:supported_data)
  |> Enum.map(fn name ->
    fun_name = :"all_#{name}"
    @doc """
    Retrieve all data for #{name}
    """
    def unquote(fun_name)(), do: Server.fetch_all(unquote(name))
  end)

  :country_data
  |> Application.get_env(:search_interfaces)
  |> Enum.map(fn {name, key} ->
    fun_name = :"search_#{name}_by_#{key}"
    @doc """
    Search all #{name} by its field #{key}
    """
    def unquote(fun_name)(value), do: Server.search(unquote(name), unquote(key), value)
  end)

end
