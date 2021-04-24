defmodule Imana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()
    # this retuns a map where emails is set as key
    data
    |> Task.async_stream(fn {key, values} -> send_email(key, values) end)
    |> Stream.run()
  end

  defp send_email(email_to, supply) do
    email_to
    |> ExpirationEmail.create(supply)
    |> Mailer.deliver_later!()
  end
end
