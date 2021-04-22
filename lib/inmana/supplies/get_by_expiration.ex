defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  def call(uuid) do
    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "supply not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end

  ## defp handle_get(%Supply{} = result), do: {:ok, result}
end
