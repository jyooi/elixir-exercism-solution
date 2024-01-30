defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)
      {:take_a_number, sender_pid} ->
        send(sender_pid , state + 1)
        loop(state + 1)

      :stop -> nil  # Terminate the process #Base case
      _ -> loop(state) # ignore the rest of the message and continue to listen to the loop
    end

  end

end
