defmodule Bob do
  def hey(input) do
    cond do
      question?(input) -> "Sure."
      nothing?(input)  -> "Fine. Be that way!"
      yelling?(input)  -> "Whoa, chill out!"
      true             -> "Whatever."
    end
  end

  defp question?(input) do
    String.match?(input, ~r/\?$/)
  end

  defp yelling?(input) do
    (String.match?(input, ~r/\pL/u) && String.upcase(input) == input)
  end

  def nothing?(input) do
    String.match?(input, ~r/^\s*$/)
  end
end
