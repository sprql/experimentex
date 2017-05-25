defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    Regex.split(~r/[_\s:,.!&@$%\^]/u, sentence, trim: true)
    |> Enum.reduce(%{}, &(count_word(&1, &2)))
  end

  defp count_word(word, acc) do
    normalized_word = String.downcase(word)
    count = acc[normalized_word] || 0
    Map.put(acc, normalized_word, count + 1)
  end
end
