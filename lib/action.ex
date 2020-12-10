defmodule Jogodavelha.Action do
  use Agent
  alias Jogodavelha.{Display,Jogo}


  def start do
    initial  = %{}
    Agent.start_link(fn -> initial end, name: __MODULE__)
  end

  def update(key,value) do
    Agent.update(__MODULE__,  &Map.put(&1, key, value))
  end


  def value do
    Agent.get(__MODULE__, & &1)
  end

  def jogadas(player,symbol,position) do

    Jogo.update(position,player,symbol)
    atualizaDisplay(position)
  end

  def atualizaDisplay(n) do
    Display.busca(n)
  end

  def jogadoComputador() do
   Jogo.value() |> Map.keys() |> Enum.each(fn args ->
      Map.get(Jogo.value(),args) |> verificaJogadas() end)
  end

  def verificaJogadas(jogada) do
   case jogada.value do
     nil -> update(jogada.position,jogada.position)
     _ -> true
   end
  end
end
