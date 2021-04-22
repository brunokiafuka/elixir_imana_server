defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email
  alias Inmana.Supply

  def create(to_email, value) do
    new_email(
      to: to_email,
      from: "noreply@inmana.com",
      subject: "Expiring supplies",
      text_body: text_email(value)
    )
  end

  defp text_email(values) do
    initial_text = " ------- Supplies that are about to expire ------- \n"
    Enum.reduce(values, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration date: #{expiration_date}, Responsible: #{responsible}\n"
  end
end
