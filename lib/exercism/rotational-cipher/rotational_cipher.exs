defmodule RotationalCipher do
  @alphabet ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  @alphabet_caps ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.split("", trim: true)
    |> Enum.map(&(rotate_letter(&1, shift)))
    |> Enum.join("")
  end

  defp rotate_letter(letter, shift) when letter in @alphabet, do: _rotate_letter(letter, shift, @alphabet)
  defp rotate_letter(letter, shift) when letter in @alphabet_caps, do: _rotate_letter(letter, shift, @alphabet_caps)
  defp rotate_letter(letter, _), do: letter

  defp _rotate_letter(letter, shift, alphabet) do
    index = Enum.find_index(alphabet, &(&1 == letter))
    rot_index = rem(index + shift, length(alphabet))
    Enum.at(alphabet, rot_index)
  end
end

