defmodule Hangman.Server do

  alias Hangman.Game

  use GenServer
  use Agent
  
###########################
# GenServer initialization
#########################

  def start_link() do
    GenServer.start_link(__MODULE__, nil)
	#Agent.start_link(fn -> 0 end)
	#|> elem(1)
	#|> Process.register(:counter)
  end

  def start_link(word) do
    GenServer.start_link(__MODULE__, word)
  end

###########################
# GenServer callbacks
#########################

  #defp count() do
  #  Agent.get_and_update(:counter, fn i -> {i, i+1} end)
  #end

  def init(_) do
    #IO.puts "Number of new games: #{count.()}"
    { :ok, Game.new_game() }
  end

  def handle_call({ :make_move, guess}, _from, game) do
    { game, tally } = Game.make_move(game, guess)
	{ :reply, tally, game }
  end

  def handle_call({ :tally }, _from, game) do
	{ :reply, Game.tally(game), game }
  end
end
