defmodule CountryDataTest do
  use ExUnit.Case
  require CountryData.TestUtils
  alias CountryData.TestUtils

  doctest CountryData

  TestUtils.test_fetch_all([
    ["countries", "name", "China"],
    ["currencies", "code", "EUR"],
    ["languages", "name", "Chinese"],
    ["regions", "name", "Central Asia"]
  ])

  TestUtils.test_search([
    ["countries", "alpha2", "US"],
    ["countries", "alpha3", "USA"],
    ["countries", "name", "United States"],
    ["countries", "currencies", "CNY"],
    ["languages", "alpha2", "en"],
    ["languages", "alpha3", "eng"],
    ["languages", "name", "English"],
    ["currencies", "code", "CNY"],
    ["currencies", "number", "156"],
    ["regions", "name", "East Asia"]
  ])
end
