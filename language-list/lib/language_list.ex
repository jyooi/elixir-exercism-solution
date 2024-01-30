defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    List.delete_at(list,0)
  end

  def first(list) do
     List.first(list,1)
  end

  def count(list), do: length(list)
  def functional_list?(list) do
    x = "Elixir"
    x in list
  end

end
