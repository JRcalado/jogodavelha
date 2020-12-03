defmodule Jogodavelha.Display do
  use Agent

    def start do
        initial = %{
                  row1: [1,2,3],
                  row2: [4,5,6],
                  row3: [7,8,9],
            }

      Agent.start_link(fn -> initial end, name: __MODULE__)

    end

    def value do
      Agent.get(__MODULE__, & &1)
    end


   def update(key) do
    Agent.update(__MODULE__,&Map.put(&1,key,[9,3,4]))
   end

    def display do
      IO.puts("\n--- Escolha a jogada ---\n")
      [Map.get(value(),:row1),Map.get(value(),:row2),Map.get(value(),:row3)]
      |>Enum.each(fn n -> IO.inspect(n,charlists: :as_lists) end)
      IO.puts("\n---  ---\n")

    end


  end
