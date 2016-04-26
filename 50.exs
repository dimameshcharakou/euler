defmodule Problem50 do
  def find(n \\ 2, acc \\ [])
  def find(n, acc) do
    if simple?(n) do
      sum = Enum.sum(acc)
      if sum + n < 1000000 do
        find(n + 1, [n|acc])
      else
        check(Enum.reverse(acc), sum)
      end
    else
      find(n + 1, acc)
    end
  end

  def check([head|tail], acc) do
    if simple?(acc) do
      IO.inspect(acc)
    else
      check(tail, acc - head)
    end
  end

  def simple?(n, i \\ 2)
  def simple?(n, i) do
    if i * i <= n do
      if rem(round(n), i) == 0 do
        false
      else
        simple?(n, i + 1)
      end
    else
      true
    end
  end
end
