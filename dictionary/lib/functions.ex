defmodule Functions do
	def func1({a,b}) do
		{b,a}
	end
	def func2(a,a) do
		true
	end
	def func2(_,_) do
		false
	end
end
