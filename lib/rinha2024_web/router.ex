defmodule Rinha2024Web.Router do
  use Rinha2024Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Rinha2024Web do
    pipe_through :api
    get "/clientes/:id/extrato", ClientController, :bank_statement
    post "/clientes/:id/transacoes", ClientController, :add_transaction
  end
end
