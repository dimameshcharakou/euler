defmodule FriendNumbers do
  def calc(a \\ 2, acc \\ [])
  def calc(10000, acc) do
    acc
    |> Enum.uniq
    |> sum
    |> IO.puts
  end

  def calc(a, acc) do
    if simple(a) do
      calc(a + 1, acc)
    else
      b = find_deviders(a) |> sum
      c = find_deviders(b) |> sum
      if c == a && a != b do
        calc(a + 1, [a|[b|acc]])
      else
        calc(a + 1, acc)
      end
    end
  end

  def find_deviders(n, i \\ 2, acc \\ [])
  def find_deviders(n, i, acc) do
    if i < n do
      if rem(n, i) == 0 do
        find_deviders(n, i + 1, [i|acc])
      else
        find_deviders(n, i + 1, acc)
      end
    else
      [1|acc]
    end
  end

  def simple(n, i \\ 2)
  def simple(n, i) do
    if i <= :math.sqrt(n) do
      if rem(round(n), i) == 0 do
        false
      else
        simple(n, i + 1)
      end
    else
      true
    end
  end

  def sum(arr, acc \\ 0)
  def sum([], acc), do: acc
  def sum([head|tail], acc) do
    sum(tail, head + acc)
  end
end
