defmodule Username do

  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    result = sanitize_everything_except_lowercase(username,[])
    Enum.reverse(result) ## making right order of the alphebet , it will improve the performance
  end

  defp sanitize_everything_except_lowercase([], result), do: result   #return base case if there is an empty charlist

  defp sanitize_everything_except_lowercase([head | tail], result) do
    new_result = if process_char(head) do process_char(head) ++ result else result end ## concatinated list should use ++ and The longer the first list is, the slower the concatenation, so avoid repeatedly appending to lists of arbitrary length so i add the char list at the first as this can understand by adding into stack does't require to create a new memory space
    sanitize_everything_except_lowercase(tail , new_result)
  end

  defp process_char(char) do
     case char do
      char when char in ?a..?z -> [char]
      char when char == ?_ -> [char]
      char when char == ?ä -> [?e , ?a]
      char when char == ?ö -> [?e , ?o]
      char when char == ?ü -> [?e , ?u]
      char when char == ?ß -> [?s , ?s]
      _ -> false
    end
  end

end
