defmodule CountryData do
  @moduledoc """
  Documentation for CountryData.
  """

  alias CountryData.Server

  :country_data
  |> Application.get_env(:supported_data)
  |> Enum.map(fn name ->
    fun_name = :"all_#{name}"
    def unquote(fun_name)(), do: Server.fetch_all(unquote(name))
  end)

  :country_data
  |> Application.get_env(:search_interfaces)
  |> Enum.map(fn {name, key} ->
    fun_name = :"search_#{name}_by_#{key}"
    def unquote(fun_name)(value), do: Server.search(unquote(name), unquote(key), value)
  end)

end
