defmodule Rinha2024Web.Router do
  use Rinha2024Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Rinha2024Web do
    pipe_through :api
    get "/clients/:id/extrato", ClientController, :bank_statement
    post "/clients/:id/transacoes", ClientController, :add_transaction
  end
end
