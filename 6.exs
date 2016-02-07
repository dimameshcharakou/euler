defmodule Calc do
  def diff(n \\ 1, min \\ 0, sub \\ 0)
  def diff(101, min, sub) do
    IO.puts(:math.pow(min, 2) - sub)
  end
  def diff(n, min, sub) do
    diff(n + 1, min + n, sub + :math.pow(n, 2))
  end
end
