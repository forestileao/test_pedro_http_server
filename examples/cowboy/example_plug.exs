Mix.install([
  {:plug_cowboy, "~> 2.0"}
])

defmodule PedroPlug do
  import Plug.Conn

  def init(options) do
    greeting = Keyword.get(options, :greeting, "Hello")
    [greeting: greeting]
  end

  def call(conn, greeting: greeting) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "#{greeting} World")
  end
end

%{
  start: {mod, fun, args}
} = Plug.Cowboy.child_spec(
  scheme: :http,
  plug: PedroPlug,
  options: [port: 4040]
)

apply(mod, fun, args)
:timer.sleep(10_000)
