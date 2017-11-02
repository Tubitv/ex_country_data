defmodule CountryData.TestUtils do
  defmacro test_fetch_all(fixture) do
    fixture
    |> Enum.map(fn [name, k, v] ->
      quote do
        test "all #{unquote(name)} data should contain #{unquote(v)}" do
          data =
            apply(CountryData, :"all_#{unquote(name)}", [])
            |> Enum.filter(& Map.get(&1, unquote(k)) == unquote(v))

          assert length(data) == 1
        end
      end
    end)
  end

  defmacro test_search(fixture) do
    fixture
    |> Enum.map(fn [name, k, v] ->
      quote do
        test "search #{unquote(name)} data should contain #{unquote(v)}" do
          data = apply(CountryData, :"search_#{unquote(name)}_by_#{unquote(k)}", [unquote(v)])
          assert length(data) == 1
        end
      end
    end)
  end
end
