defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{plots: [], next_plot_id: 1} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state.plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      new_plot = %Plot{plot_id: state.next_plot_id, registered_to: register_to}
      {new_plot, %{plots: [new_plot | state.plots], next_plot_id: state.next_plot_id + 1}}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn state ->
      {:ok, %{state | plots: Enum.filter(state.plots, fn plot -> plot.plot_id != plot_id end)}}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state ->
      Enum.find(
        state.plots,
        {:not_found, "plot is unregistered"},
        fn plot -> plot.plot_id == plot_id end
      )
    end)
  end
end
