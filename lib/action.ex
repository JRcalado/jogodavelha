defmodule Jogodavelha.Action do
  use Agent
  alias Jogodavelha.{Display,Jogo}

  @computer  "computador"
  @computer_symbol  "Y"
  @player "voce"
  @player_symbol  "X"

  def start do
    initial  = %{}
    Agent.start_link(fn -> initial end, name: __MODULE__)
  end

  def update(key,value) do
    Agent.update(__MODULE__,  &Map.put(&1, key, value))
  end

  def delete(key) do
    Agent.update(__MODULE__,  &Map.delete(&1, key))
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def jogadas(player,symbol,position) do
    Jogo.update(position,player,symbol)
    atualizaDisplay(position)

    buscaJogadas()
  end

  def jogadaPlay(position) do
      jogadas(@player,@player_symbol,position)
  end


  def jogadaComputador() do
    jogadas(@computer,@computer_symbol,positionAutomatica())
end

  def atualizaDisplay(n) do
    Display.busca(n)
  end

  def buscaJogadas() do
   Jogo.value() |> Map.keys() |> Enum.each(fn args ->
      Map.get(Jogo.value(),args) |> atualizaJogadas() end)
  end

  def atualizaJogadas(jogada) do
    case jogada.value do
      nil -> update(jogada.position,jogada.position)
      _ -> delete(jogada.position)
    end
  end

  def positionAutomatica() do
    value() |> Map.keys() |> Enum.random()
  end
end
