defmodule Jogodavelha.Display do
  alias Jogodavelha.{Jogo}
  use Agent

    def start do
        initial = %{
                  row1: [1,2,3],
                  row2: [4,5,6],
                  row3: [7,8,9],
                  _1_: 1,
                  _2_: 2,
                  _3_: 3,
                  _4_: 4,
                  _5_: 5,
                  _6_: 6,
                  _7_: 7,
                  _8_: 8,
                  _9_: 9

            }

      Agent.start_link(fn -> initial end, name: __MODULE__)

    end

    def value do
      Agent.get(__MODULE__, & &1)
    end

    def teste do
      # Agent.get(__MODULE__,fn state -> Map.values(state)
      #       |> List.to_charlist()
      #       |> MapSet.member?(MaSet.new(),3)
      #        end)
      Agent.get(__MODULE__,fn state ->
        Map.keys(state)
        # Enum.map(state,fn args -> args end)
      # |> List.flatten()
      # |> Enum.find_value(fn args -> args == 3 end)
        end)


    end

    def busca(key) do
      key = "_" <> Integer.to_string(key) <> "_"

      jogo = Jogo.value()
      |> Map.fetch!(String.to_atom(key))

      updateDisplay(key,jogo.value)

      # value()
      #  |> Map.fetch!(String.to_atom(key))

    end

    def updateDisplay(key,value) do
      Agent.update(__MODULE__, fn state ->
        Map.replace!(state, String.to_atom(key),value)

    end)
  end

   def update(key) do
    Agent.update(__MODULE__,&Map.replace!(&1,key,[9,3,4]))
   end

    def display do
      IO.puts("\n--- Escolha a jogada ---\n")
      [Map.get(value(),:row1),Map.get(value(),:row2),Map.get(value(),:row3)]
      |>Enum.each(fn n -> IO.inspect(n,charlists: :as_lists) end)
      IO.puts("\n---  ---\n")

    end

    def displayTeste do
      IO.puts("\n--- Escolha a jogada ---\n")
      IO.puts("#{Map.get(value(),:_1_)} | #{Map.get(value(),:_2_)} | #{Map.get(value(),:_3_)}")
      IO.puts("#{Map.get(value(),:_4_)} | #{Map.get(value(),:_5_)} | #{Map.get(value(),:_6_)}")
      IO.puts("#{Map.get(value(),:_7_)} | #{Map.get(value(),:_8_)} | #{Map.get(value(),:_9_)}")

    end


  end
