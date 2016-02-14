defmodule Finder do
  def search(counter \\ 2)
  def search(counter) do
    t = find_triangle_number(counter)
    IO.puts(t)
    if find_deviders(t) > 500 do
      IO.puts(t)
    else
      search(counter + 1)
    end
  end

  def find_triangle_number(n) do
    p = n - 1
    round(((p * (p + 1)) / 2) + n)
  end

  def find_deviders(t, i \\ 2, acc \\ [])
  def find_deviders(t, i, acc) do
    if simple(t) do
      arr = [round(t)|acc]
      calc(Enum.uniq(arr), arr)
    else
      if rem(round(t), i) == 0 do
        find_deviders(t / i, i, [i|acc])
      else
        find_deviders(t, i + 1, acc)
      end
    end
  end

  def calc(a, arr, acc \\ [])
  def calc([], _arr, acc) do
    acc
    |> Enum.map(&(&1 + 1))
    |> Enum.map(&(Integer.to_string(&1)))
    |> multiple
  end
  def calc([head|tail], arr, acc) do
    new = Enum.filter(arr, fn(x) -> x == head end) |> length
    calc(tail, arr, [new|acc])
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

  def multiple([]), do: 1
  def multiple([head|tail]) do
    String.to_integer(head) * multiple(tail)
  end
end
