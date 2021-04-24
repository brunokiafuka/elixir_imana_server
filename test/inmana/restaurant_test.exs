defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, it returns a valid changeset" do
      params = %{name: "Bwéd pitéu", email: "info@bwedpiteu.com"}

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{email: "info@bwedpiteu.com", name: "Bwéd pitéu"},
               valid?: true
             } = result
    end

    test "when blank email, it returns an invalid changeset" do
      params = %{name: "Bs", email: ""}
      expected_result = %{email: ["can't be blank"]}
      result = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = result
      assert errors_on(result) == expected_result
    end

    test "when name less than 2 chars, it returns an invalid changeset" do
      params = %{name: "B", email: "info@bwedpiteu.com"}
      expected_result = %{name: ["should be at least 2 character(s)"]}
      result = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = result
      assert errors_on(result) == expected_result
    end
  end
end
