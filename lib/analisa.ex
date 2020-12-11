defmodule Jogodavelha.Analisa do
alias Jogodavelha.{Action, Jogo}

  @combinacoes_vitorias %{
   1 => [1,2,3],
   2 => [1,4,7],
   3 => [1,5,9],
   4 => [3,5,7],
   5 => [3,6,9],
   6 => [7,8,9]
  }
  def analisaVitoria(jogador) do
    Jogo.value() |> Map.keys() |> Enum.each(fn args ->
      Map.get(Jogo.value(),args) |> separaJogadas(jogador) end)
  end

  def separaJogadas(jogadas,jogador) do

    cond do
      jogador == jogadas.player  ->
        update(jogadas.position,jogador)
      jogador != jogadas.player ->
        delete(jogadas.position)

    end
    # if jogador == jogadas.player do
    #   update(jogadas.position,jogador)
    # end


  end

  def anal do
    value() |> Map.keys() |> testando()
  end
  def testando(lista) do

    @combinacoes_vitorias
    |> Map.keys()
    |> Enum.each(fn args ->
      Map.get(@combinacoes_vitorias,args)
      |> verifica(lista) end)

    # List.myers_difference(lista, [1,2,3])

  end
  def verifica(combinacao,lista)do
  tem_combinacao =  List.myers_difference(lista, combinacao)

    if is_list( tem_combinacao[:eq]) do
       cond do
        Enum.count( tem_combinacao[:eq]) == 3  -> IO.inspect("Ganhou!!!!")
        Enum.count( tem_combinacao[:eq]) != 3  -> TRUE
       end


    end

    # cond  do
    #   Enum.count( tem_combinacao[:eq])  -> IO.inspect("ganhou!!!!!")

    # end

    # case Enum.count( tem_combinacao[:eq]) do
    #   3 -> IO.inspect("ganhou!!!!!")
    #   _ -> true
    # end

  end
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

  def delete(key) do
    Agent.update(__MODULE__,  &Map.delete(&1, key))
  end

end
