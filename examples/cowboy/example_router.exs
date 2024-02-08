Mix.install([
  {:plug_cowboy, "~> 2.0"}
])

defmodule ExampleRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "Hello, world!")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end

%{start: {mod, fun, args}}= Plug.Cowboy.child_spec(
  scheme: :http,
  plug: ExampleRouter,
  options: [port: 4040]
)

apply(mod, fun, args)
:timer.sleep(10_000)
