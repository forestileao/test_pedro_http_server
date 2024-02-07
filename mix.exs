defmodule TestPedroHttpServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :test_pedro_http_server,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TestPedroHttpServer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:pedro_http_server, path: "../pedro_http_server"}
    ]
  end
end
