port = Port.open({:spawn, "elixir sqrt.exs"}, [:binary])

send port, {self(), {:command, "100\n"}}
receive do
  {^port, {:data, data}} -> IO.puts "Got: #{data}"
end

send port, {self(), :close}
receive do
  {^port, :closed} -> IO.puts "Closed"
end