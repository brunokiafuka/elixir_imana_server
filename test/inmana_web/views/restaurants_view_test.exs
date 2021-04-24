defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase
  import Phoenix.View
  alias InmanaWeb.RestaurantsView
  alias Inmana.Restaurant

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Bwéd pitéu", email: "info@bwedpiteu.com"}

      {:ok, restaurant} = Inmana.create_restaurant(params)

      result = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "restaurant created",
               restaurant: %Restaurant{
                 email: "info@bwedpiteu.com",
                 id: _id,
                 name: "Bwéd pitéu"
               }
             } = result
    end
  end
end
