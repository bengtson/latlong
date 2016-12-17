defmodule LatLongTest do
  use ExUnit.Case
  doctest LatLong

  test "degree conversion" do
    position = LatLong.parse "39.1373 ", "-88.65"
    assert position == {39.1373, -88.65}
  end

  test "degree conversion with degree character" do
    position = LatLong.parse "39.1373°", "-88.65"
    assert position == {39.1373, -88.65}
  end

  test "degree minute second conversion" do
    position = LatLong.parse "39° 30\" 30\'", "-88.65"
    assert position == {39.50833333333333, -88.65}
  end

  test "degree minute second conversion with compass" do
    position = LatLong.parse "39.1371°N", "88.65°W"
    assert position == {39.1371, -88.65}
  end

  test "check for compass usage error" do
    position = LatLong.parse "39.1371°E", "88.65°W"
    assert position == {:error, "Error Parsing Latitude"}
  end

  test "check for missing minutes value" do
    position = LatLong.parse "39° 30\'N", "88.65°W"
    assert position == {:error, "Error Parsing Latitude"}
  end

  test "check for out of range" do
    position = LatLong.parse "39.1371°N", "188.65°W"
    assert position == {:error, "Longitude < -180.0°"}
  end

  test "check for single string latlong" do
    position = LatLong.parse "39.1371°N, 88.65°W"
    assert position == {39.1371, -88.65}
  end

end
