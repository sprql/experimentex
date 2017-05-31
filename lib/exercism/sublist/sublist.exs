defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a === b, do: :equal
  def compare(a, b) when length(a) > length(b) do
    if _compare(b, a), do: :superlist, else: :unequal
  end
  def compare(a, b) do
    if _compare(a, b), do: :sublist, else: :unequal
  end

  def _compare([], _), do: true
  def _compare(_, []), do: false
  def _compare(a, b) when length(a) > length(b), do: false
  def _compare(a, b) do
    list = find_start(b, hd(a))
    cond do
      compare_lists(a, list) -> true
      list == [] -> false
      true ->
        [_ | rest] = list
        _compare(a, rest)
    end
  end

  def find_start([], _), do: []
  def find_start([head | rest] = list, element) do
    if head === element do
      list
    else
      find_start(rest, element)
    end
  end

  def compare_lists([], _), do: true
  def compare_lists(_, []), do: false
  def compare_lists([a_head | a_rest], [b_head | b_rest]) do
    if a_head === b_head do
      compare_lists(a_rest, b_rest)
    else
      false
    end
  end
end
