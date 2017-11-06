defmodule CountryData.Defaults do
  @moduledoc false
  def supported_data, do: ["countries", "languages", "currencies", "regions"]

  def search_interfaces,
    do: [
      {"countries", "alpha2"},
      {"countries", "alpha3"},
      {"countries", "name"},
      {"countries", "currencies"},
      {"languages", "alpha2"},
      {"languages", "alpha3"},
      {"languages", "name"},
      {"currencies", "code"},
      {"currencies", "number"},
      {"regions", "name"}
    ]
end
