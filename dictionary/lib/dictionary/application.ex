defmodule Dictionary.Application do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

	children = [
	  worker(Dictionary.WordList, []),
	]

	options = [
	  name: Dictionary.Supervisor,
	  strategy: :one_for_one,
	  max_restarts: 1,
	  max_seconds: 5,
	]

	Supervisor.start_link(children, options)
  end
end
