# improve this codebase to make it more concise


defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory,&(&1.price), :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn map -> map[:price] == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn map ->
      if String.contains?(map[:name], old_word) do
        Map.put(map, :name, String.replace(map[:name], old_word, new_word))
      else
        map
      end
    end)
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Map.new(item.quantity_by_size, fn {k, v} -> {k, v + count} end)}
  end

  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, fn {_key, val}, acc -> acc + val end)
  end
end
