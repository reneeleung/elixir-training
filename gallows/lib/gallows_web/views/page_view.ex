defmodule GallowsWeb.PageView do
  use GallowsWeb, :view

  def plural_of(word,1), do: "1 " <> word
  def plural_of(word, c) do
    cond do
	  c < 0 ->
	    "<span style='color: red'>#{c} #{word}s</span>"
	  true ->
	    "#{c} " <> word <> "s"
	end
  end
end
