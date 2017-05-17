defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @commands_map [
    {1, "wink"},
    {2, "double blink"},
    {4, "close your eyes"},
    {8, "jump"}
  ]

  @reverse_bit 16

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result = Enum.reduce(@commands_map, [], fn({bit, msg}, acc) ->
      if has_bit?(code, bit) do
        [msg | acc]
      else
        acc
      end
    end)

    if has_bit?(code, @reverse_bit) do
      result
    else
      Enum.reverse(result)
    end
  end

  defp has_bit?(code, bit), do: band(code, bit) == bit
end

