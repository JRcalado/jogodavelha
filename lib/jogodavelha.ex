defmodule Jogodavelha do
  alias Jogodavelha.{Jogo, Display}
  def inicia do
    Jogo.start()
    Jogo.value()
    Display.start()
    Display.display()


  end

  def exibir do
    Jogo.value()
    |> Map.keys()
    |> Enum.each(fn x -> Jogo.buscaStruct(x,:position) |> format_out()  end)

  end

  def format_out(out) do
    IO.puts(out)
    IO.puts('__')

  end


end
