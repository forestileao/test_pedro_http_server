defmodule TestPedroHttpServer.Application do
  @moduledoc false
  use Application

  @port 4040

  @impl true
  def start(_type, _args) do
    children = [
      {Pedro.HttpServer, [@port]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestPedroHttpServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
