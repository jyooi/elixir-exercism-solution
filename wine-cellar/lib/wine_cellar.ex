defmodule WineCellar do


  def explain_colors do
    [white: "Fermented without skin contact.",
     red: "Fermented with skin contact using dark-colored grapes.",
     rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end


  def filter(cellar, color, opts \\ []) do
    Keyword.get_values(cellar, color)
    |> filter_by_year(opts[:year])
    |> filter_by_country(opts[:country])
  end

  # Helper functions for filtering based on options
  defp filter_by_options(wines, options) do
    wines
    |> filter_by_year(Keyword.get(options, :year, nil))
    |> filter_by_country(Keyword.get(options, :country, nil))
  end

  # Refactored filter_by_year/2
  defp filter_by_year(wines, nil), do: wines
  defp filter_by_year(wines, year), do: Enum.filter(wines, fn {_name, y, _origin} -> y == year end)

  # Refactored filter_by_country/2
  defp filter_by_country(wines, nil), do: wines
  defp filter_by_country(wines, country), do: Enum.filter(wines, fn {_name, _year, origin} -> origin == country end)

    # ... other functions ...


  # The functions below do not need to be modified.
  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
