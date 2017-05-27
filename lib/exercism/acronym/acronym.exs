defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/(\p{Ll})(\p{Lu})/, "\\1 \\2")
    |> String.replace(~r{^(\w)\w*}, "\\1")
    |> String.replace(~r{\W(\w)\w*}, "\\1")
    |> String.replace(~r{\W}, "")
    |> String.upcase
  end
end
