defmodule Problem28 do
  def calc(a \\ 1, acc \\ 1, sum \\ 1, x \\ 2, y \\ 2)
  def calc(_a, 1001, sum, _x, _y), do: IO.puts(sum)
  def calc(a, acc, sum, x, y) do
    new_a = a + x
    if rem(x, 4) == 0 do
      new_b = new_a + y
      calc(new_a, acc + 1, sum + new_a + new_b, x + 2, y + 2)
    else
      new_b = new_a + y
      calc(new_a, acc + 1, sum + new_a + new_b, x + 2, y)
    end
  end
end
