defmodule GuessingGame do
  def compare(_secret_number, _guess \\ :no_guess)
  def compare(secret_number, guess) when guess == secret_number, do: "Correct"
  def compare(secret_number, guess) when guess - secret_number > 1, do: "Too high"
  def compare(secret_number, guess) when guess - secret_number < -1, do: "Too low"
  def compare(secret_number, guess) when guess - secret_number == 1, do: "So close"
  def compare(secret_number, guess) when guess - secret_number == -1, do: "So close"

  def compare(_secret_number, :no_guess), do: "Make a guess"
end
