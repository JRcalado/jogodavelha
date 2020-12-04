defmodule Jogodavelha do
  alias Jogodavelha.{Jogo, Display, Action, Jogadores}

  @computer  "computador"
  @computer_symbol  "X"
  @player "voce"
  @player_symbol  "O"

  def inicia do
    Jogo.start()
    Jogo.value()
    Display.start()
    Display.display()


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
    Action.jogadas(@player,@computer_symbol,position)
  end

  def cria_jogador(name, symbol) do
    Jogadores.build(name,symbol)
  end


end
