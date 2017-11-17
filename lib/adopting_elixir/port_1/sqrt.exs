for line <- IO.stream(:stdio, :line) do
  line
  |> String.replace(~r/[^\-\d\.]/, "")
  |> String.to_integer
  |> :math.sqrt
  |> IO.write
end