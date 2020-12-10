defmodule Jogodavelha do
  alias Jogodavelha.{Jogo, Display, Action, Jogadores}


  def inicia do
    Jogo.start()
    Jogo.value()
    Display.start()
    Display.displayJogo()
    Action.start()


  end

  def exibir do
    # Jogo.value()
    # |> Map.keys()
    # |> Enum.each(fn x -> Jogo.buscaStruct(x,:position) |> format_out()  end)


  end

  def format_out(out) do
    IO.puts(out)
    IO.puts('__')

  end


  def jogada(position) do
    Action.jogadaPlay(position)

    jogadaComputador()
    Display.displayJogo()
  end

  defp jogadaComputador() do
    Action.jogadaComputador()
  end
  def cria_jogador(name, symbol) do
    Jogadores.build(name,symbol)
  end


end
