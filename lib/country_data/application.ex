defmodule CountryData.Application do
  @moduledoc false
  alias CountryData.Server

  use Application

  def start(_type, _args) do
    servers =
      :country_data
      |> Application.get_env(:supported_data)
      |> Enum.map(&Supervisor.child_spec({Server, &1}, id: String.to_atom(&1)))

    children = [{Registry, [keys: :unique, name: :country_data_registry]}] ++ servers
    opts = [strategy: :one_for_one, name: CountryData.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
