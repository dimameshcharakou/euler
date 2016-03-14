defmodule Problem23 do
  def calc(a \\ 1, acc \\ 0, abundants \\ [])
  def calc(28124, acc, _abundants), do: IO.puts(acc)
  def calc(a, acc, abundants) do
    IO.puts(a)
    if check_abundants(a, abundants) do
      if abundant(a) do
        calc(a + 1, acc, [a|abundants])
      else
        calc(a + 1, acc, abundants)
      end
    else
      if abundant(a) do
        calc(a + 1, acc + a, [a|abundants])
      else
        calc(a + 1, acc + a, abundants)
      end
    end
  end

  def check_abundants(_result, []), do: false
  def check_abundants(result, [head|tail]) do
    if abundant(result - head) do
      true
    else
      check_abundants(result, tail)
    end
  end

  def abundant(a) do
    find_deviders(a) |> Enum.sum > a
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
end
