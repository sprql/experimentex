defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.split("", trim: true)
    |> Enum.reduce({nil, 0, ""}, &encode/2)
    |> encode_sequence
  end

  defp encode(letter, {previous, count, acc}) do
    if letter == previous do
      {previous, count + 1, acc}
    else
      {letter, 1, encode_sequence({previous, count, acc})}
    end
  end

  defp encode_sequence({element, count, encoded}) do
    count = if count > 1, do: count, else: ""
    "#{encoded}#{count}#{element}"
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r{(\d+[\pL ]|[\pL ])+}U, string, capture: :all_but_first)
    |> List.flatten
    |> Enum.map(&decode_sequence/1)
    |> Enum.join("")
  end

  defp decode_sequence(sequence) do
    if String.match?(sequence, ~r{\d+[\pL ]}) do
      [num, letter] = Regex.run(~r{(\d+)([\pL ])}, sequence, capture: :all_but_first)
      num = String.to_integer(num)
      String.duplicate(letter, num)
    else
      sequence
    end
  end
end
