defmodule Jogodavelha.Jogadores do

  @required_keys [:name, :symbol]
  @enforce_keys @required_keys
  defstruct @required_keys
  def build(name,symbol) do
    %Jogodavelha.Jogadores{
      name: name,
      symbol: symbol
    }
  end


end
