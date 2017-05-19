defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    _keep(list, fun, [])
  end

  defp _keep([], _, acc), do: _reverse(acc, [])
  defp _keep([item | list], fun, acc) do
    acc = if fun.(item) do [item | acc] else acc end
    _keep(list, fun, acc)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    _discard(list, fun, [])
  end

  defp _discard([], _, acc), do: _reverse(acc, [])
  defp _discard([item | list], fun, acc) do
    acc = if fun.(item) do acc else [item | acc] end
    _discard(list, fun, acc)
  end

  defp _reverse([], acc), do: acc
  defp _reverse([item | list], acc) do
    _reverse(list, [item | acc])
  end
end
