defmodule GoodMorningBotTest do
  use ExUnit.Case
  doctest GoodMorningBot

  test "greets the world" do
    assert GoodMorningBot.hello() == :world
  end
end
