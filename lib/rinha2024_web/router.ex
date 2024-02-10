defmodule Rinha2024Web.Router do
  use Rinha2024Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Rinha2024Web do
    pipe_through :api
  end
end
