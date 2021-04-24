defmodule Inmana.WelcomerTest do
  use ExUnit.Case
  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when user is special, it returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are special"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when user is not special, it returns a message" do
      params = %{"name" => "rafael", "age" => "42"}
      expected_result = {:ok, "Welcome rafael"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when user is under age, it returns an error" do
      params = %{"name" => "rafael", "age" => "12"}
      expected_result = {:error, "You shall not pass"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
