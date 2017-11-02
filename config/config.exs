use Mix.Config

config :country_data, supported_data: ["countries", "languages", "currencies", "regions"]

config :country_data, search_interfaces: [
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
