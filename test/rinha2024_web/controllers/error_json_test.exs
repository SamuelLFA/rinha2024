defmodule Rinha2024Web.ErrorJSONTest do
  use Rinha2024Web.ConnCase, async: true

  test "renders 404" do
    assert Rinha2024Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Rinha2024Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
