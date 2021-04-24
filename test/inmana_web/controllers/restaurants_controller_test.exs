defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, return the created restaurant", %{conn: conn} do
      params = %{name: "Bwéd pitéu", email: "info@bwedpiteu.com"}

      result =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "restaurant created",
               "restaurant" => %{
                 "email" => "info@bwedpiteu.com",
                 "id" => _id,
                 "name" => "Bwéd pitéu"
               }
             } = result
    end

    test "when all params are invalid, return error", %{conn: conn} do
      params = %{name: "", email: "info@bwedpiteu.com"}
      expected_result = %{"message" => %{"name" => ["can't be blank"]}}

      result =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert expected_result == result
    end
  end
end
