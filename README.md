# Latlong

Provides a parser for latitude and longitude strings. Handles various formats for specifying a position. Parsing returns a tuple latitude and longitude in a signed decimal degree format. The parser accepts the following formats:

- 38.8977, -77.0365
- 38° 53' 51.635" N, 77° 2' 11.507" W
- 38 53 51.635 N, 77 2 11.507 W
- N 38° 53' 51.635", W 77° 2' 11.507"
- N 38 53 51.635, W 77 2 11.507
- 38 53 51.635, -77 2 11.507
- 90, 0 (North Pole)
- 41 25 01N, 120 58 57W
- 41°25'01"N, 120°58'57"W
- S17 33 08.352, W69 01 29.74
- 41 25N, 120 58W
- 41°25'N, 120°58'W
- N41 25.117, W120 58.292
- 41 N, 120 W
- 41°N, 120°W
- N41.092, W120.8362
- 90S, 0E (South Pole)

## Example Usage

    iex> LatLong.parse "39.1371°N, 88.65°W"
    {39.1371, -88.65}

    iex> LatLong.parse "39.1371°E", "88.65°W"
    {:error, -88.65}

  The second example above returns an error since latitude is NS and E was specified. The correct function call is:

    iex> LatLong.parse "39.1371°N", "88.65°W"
    {:error, -88.65}

## Road Map

  A formatting function needs to be provided that takes a format string such as these:

    d.°D         39.1371°N
    d° m' s"D     39° 20' 33"S
    Sd.           39.1371
    Sd m.'         39 20.5

  Formatting could also be provided with parsing for a 'strict' mode.
  After parsing, a format string could be returned that defines the format encountered during the parse. This could be useful for reformatting in the format provided for parsing.

  A mode could be added that insures both the longitude and the latitude use the same format.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `latlong` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:latlong, "~> 0.1.0"}]
    end
    ```
