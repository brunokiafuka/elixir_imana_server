defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)
    name |> String.trim() |> String.downcase() |> evaluate(age)
  end

  ## pattern matching...
  # defp => private functions.
  defp evaluate("banana", 42) do
    {:ok, "You are special"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(_name, _age) do
    {:error, "You shall not pass"}
  end
end
