defmodule Jogodavelha do
  alias Jogodavelha.Jogo
  def inicia do
    Jogo.start()
    Jogo.value()

  end

  def exibir do
    Jogo.value()
    |> Map.values()

  end
end
