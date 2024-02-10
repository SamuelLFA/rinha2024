defmodule Rinha2024Web.ClientJSON do
alias Rinha2024.Clients.ClientSchema

  def transaction(%{client: client}) do
    client_data(client)
  end

  defp client_data(%ClientSchema{} = client) do
    %{
      limite: client.limit,
      saldo: client.balance,
    }
  end

  def statement(%{client: client}) do
    data(client)
  end

  defp data(%ClientSchema{} = client) do
    %{
      saldo: %{
        total: client.balance,
        data_extrato: DateTime.now!("Etc/UTC"),
        limite: client.limit,
      },
      ultimas_transacoes: Enum.map(client.transactions, fn transaction -> %{
        valor: transaction.value,
        type: transaction.type,
        descricao: transaction.description
      } end),
    }
  end

  def not_found(%{id: id}) do
    %{
      error: "id: #{id} not found"
    }
  end

  def bad_request(%{changeset: changeset}) do
    %{
      errors: Enum.map(changeset.errors, fn({key, {reason, _}}) -> "#{key}: #{reason}" end)
    }
  end
end
