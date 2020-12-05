defmodule Jogodavelha.Jogo do
  use Agent
    def start do
      initial = %{_1_: %{value: nil, player: nil, position: 1},
                  _2_: %{value: nil, player: nil, position: 2},
                  _3_: %{value: nil, player: nil, position: 3},
                  _4_: %{value: nil, player: nil, position: 4},
                  _5_: %{value: nil, player: nil, position: 5},
                  _6_: %{value: nil, player: nil, position: 6},
                  _7_: %{value: nil, player: nil, position: 7},
                  _8_: %{value: nil, player: nil, position: 8},
                  _9_: %{value: nil, player: nil, position: 9}
                }
      Agent.start_link(fn -> initial end, name: __MODULE__)

    end
    def value do
       Agent.get(__MODULE__, & &1)
    end

   def buscaStruct(key,key_interna) do
     Map.get(value(),key)
     |> Map.get(key_interna)

   end

   def update(key,player,symbol) do

      updateValue(key,:player,player)
      updateValue(key,:value,symbol)
   end

   def updateValue(key,key_interna,value) do
    key = "_" <> Integer.to_string(key) <> "_"

    position = value()
    |> Map.fetch!(String.to_atom(key))

    Agent.update(__MODULE__, fn state ->
        Map.replace!(state, String.to_atom(key),Map.replace!(position,key_interna, value))

    end)
   end



end
