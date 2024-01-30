defmodule HighSchoolSweetheart do
  def first_letter(name) do

    trimmed_string = String.trim_leading(name)
    String.slice(trimmed_string, 0, 1)
  end

  @spec initial(binary()) :: nonempty_binary()
  def initial(name) do
    String.upcase(first_letter(name)) <> "."
  end

  def initials(full_name) do
    [first_name , last_name] = String.split(full_name, " ")
    initial(first_name) <>" "<> initial(last_name)
    # Please implement the initials/1 function
  end

  def pair(full_name1, full_name2) do
    ff = initials(full_name1)
    ss = initials(full_name2)
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{ff}  +  #{ss}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
