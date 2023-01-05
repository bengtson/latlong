defmodule Latlong.Mixfile do
  use Mix.Project

  def project do
    [app: :latlong,
     version: "0.1.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Latitude, Longitude Parser",
     package: package(),
     deps: deps(),

     # Docs
     name: "latlong",
     source_url: "https://github.com/bengtson/latlong",
     docs: [main: "LatLong", # The main page in the docs
            extras: ["README.md"]]]

  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
  end

  def package do
  [
    maintainers: ["Michael Bengtson"],
    licenses: ["Apache 2 (see the file LICENSE for details)"],
    links: %{"GitHub" => "https://github.com/bengtson/latlong"}
  ]
end



  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.14", only: :dev}]
  end
end
