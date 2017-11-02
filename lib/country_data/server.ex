defmodule CountryData.Server do
  @moduledoc """
  Load the source data and provide fetch / search service
  """
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: via_tuple(name))
  end

  def fetch_all(name) do
    GenServer.call(via_tuple(name), :fetch_all)
  end

  def search(name, key, value) do
    GenServer.call(via_tuple(name), {:search, key, value})
  end

  # callbacks
  def init(name) do
    data =
      :country_data
      |> Application.app_dir
      |> Path.join("priv/#{name}.json")
      |> File.read!
      |> Poison.decode!
    {:ok, data}
  end

  def handle_call(:fetch_all, _from, data) do
    {:reply, data, data}
  end

  def handle_call({:search, key, value}, _from, data) do
    result = Enum.filter(data, fn item ->
      v = Map.get(item, key)
      case is_list(v) do
        true -> value in v
        _    -> value == v
      end
    end)
    {:reply, result, data}
  end

  def handle_call(_msg, _from, data) do
    {:reply, nil, data}
  end

  # private functions
  defp via_tuple(name), do: {:via, Registry, {:country_data_registry, name}}
end
