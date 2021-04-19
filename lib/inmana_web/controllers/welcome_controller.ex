defmodule InmanaWeb.WelcomeController do
  alias Inmana.Welcomer, as: Welcomer
  use InmanaWeb, :controller

  def index(conn, params) do
    params
    |> Welcomer.welcome()
    |> handle_response(conn)
  end

  defp handle_response({:ok, message}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: message})
  end

  defp handle_response({:error, message}, conn), do: handle_response(conn, message, :bad_request)

  defp handle_response(conn, message, status) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
end
