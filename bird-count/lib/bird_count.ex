defmodule BirdCount do
    # pattern matching on function argument for return 0 without if condition
  def today([]), do: nil

  def today(list) do
    [head | _tail] = list
    head
  end

  # pattern matching on function argument for return 1 without if condition
  def increment_day_count([]), do: [1]
  def increment_day_count(1), do: []

  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?(list), do: do_check(list)

  defp do_check([]), do: false  # Base case for the recursion in do_check

  defp do_check([head | tail]) do
    if head == 0 do
      true
    else
      do_check(tail) # Recursive call if the current element is greater than 0
    end
  end

  def total(list), do: increment(list)

  def increment([]), do: 0  # Base case: return 0 for an empty list

  def increment([head | tail]) do
    head + increment(tail)
  end



  def busy_days(bird_counts) do
    count_busy_days(bird_counts, 0)
  end

  defp count_busy_days([], busy_days_counter), do: busy_days_counter # return 0 for basecase argument

  defp count_busy_days([head | tail], busy_days_counter) do
    new_counter =
      if head >= 5 do
        busy_days_counter + 1
      else
        busy_days_counter
      end

    count_busy_days(tail, new_counter)
  end

end

# notes : always remember base case when you set recursive function
