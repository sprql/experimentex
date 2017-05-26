defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    list
    |> accumulate(fun, [])
    |> reverse([])
  end

  defp accumulate([], _, acc), do: acc
  defp accumulate([element | rest], fun, acc), do: accumulate(rest, fun, [fun.(element) | acc])

  defp reverse([], reversed), do: reversed
  defp reverse([element | rest], reversed), do: reverse(rest, [element | reversed])
end
