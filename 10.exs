defmodule Calc do
  # TODO: find ways to optimize
  def sum(n \\ 2, acc \\ 0)
  def sum(2000000, acc), do: IO.puts(acc)
  def sum(n, acc) do
    if simple(n) do
      sum(n + 1, acc + n)
    else
      sum(n + 1, acc)
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
