defmodule Experimentex.Benchmarks.CharsVsString do
  def run do
    char_list = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
    string_list = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

    Benchee.run(%{
      "chars"  => fn -> char_list |> Enum.filter(fn(c) -> c == ?A end) end,
      "string" => fn -> string_list |> String.graphemes |> Enum.filter(fn(s) -> s == "A" end) end
    }, time: 10)
  end
end

