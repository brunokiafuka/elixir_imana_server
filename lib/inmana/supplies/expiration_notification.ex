defmodule Imana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()
    # this retuns a map where emails is set as key

    Enum.each(data, fn {key, values} ->
      key
      |> ExpirationEmail.create(values)
      |> Mailer.deliver_later!()
    end)
  end
end
