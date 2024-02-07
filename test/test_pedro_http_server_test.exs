defmodule TestPedroHttpServerTest do
  use ExUnit.Case
  doctest TestPedroHttpServer

  test "greets the world" do
    assert TestPedroHttpServer.hello() == :world
  end
end
