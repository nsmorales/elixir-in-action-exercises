defmodule TodoList do
  def new(), do: %{}

  def add_entry(todo, date, entry) do
    Map.update(todo, date, [entry], fn existing -> [entry | existing] end)
  end

  def entries(todo, date) do
    Map.get(todo, date, [])
  end
end
