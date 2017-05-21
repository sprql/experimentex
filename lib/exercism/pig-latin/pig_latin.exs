defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    vowels_regexp = ~r/^(yt|xr|a|e|i|o|u)(\w+)$/
    consonants_regexp = ~r/^(ch|qu|squ|thr|th|sch|b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|w|x|y|z)(\w+)$/

    cond do
      String.match?(word, vowels_regexp)
        -> Regex.replace(vowels_regexp, word, "\\1\\2ay")
      String.match?(word, consonants_regexp)
        -> Regex.replace(consonants_regexp, word, "\\2\\1ay")
    end
  end
end

