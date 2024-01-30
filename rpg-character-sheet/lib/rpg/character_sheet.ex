defmodule RPG.CharacterSheet do
  def welcome() do
    IO.write("Welcome! Let's fill out your character sheet together.\n")
  end

  def ask_name() do
    name = IO.gets("What is your character's name?\n")
    String.trim(name)
  end


  def ask_class() do
    class = IO.gets("What is your character's class?\n")
    String.trim(class)
  end

  def ask_level() do
     get_number("What is your character's level?\n")
  end

  defp get_number(prompt) do
    input = IO.gets(prompt)
    case Integer.parse(String.trim(input)) do
      {number, ""} ->
        number  # Successfully parsed a number
      _ ->
        IO.puts("Please enter a valid number.")
        get_number(prompt)  # Prompt again for input
    end
    String.to_integer(String.trim(input))
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    character_map = %{:name => name , :class => class , :level => level}
    IO.inspect(character_map, label: "\nYour character")
  end
end
