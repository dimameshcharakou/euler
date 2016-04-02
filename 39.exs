defmodule Problem39 do
  def find(p \\ 3, a \\ 1, b \\ 1, acc \\ 0, p_acc \\ 0)
  def find(1000, _a, _b, _acc, p_acc), do: IO.puts(p_acc)
  def find(p, a, b, acc, p_acc) do
    x = find_solutions(a, b, p)
    if x > acc do
      find(p + 1, a, b, x, p)
    else
      find(p + 1, a, b, acc, p_acc)
    end
  end

  def find_solutions(a, b, p, acc \\ [])
  def find_solutions(a, b, p, acc) do
    if p - b > 1 do
      if valid?(a, b, p) do
        find_solutions(a, b + 1, p, [[a, b]|acc])
      else
        find_solutions(a, b + 1, p, acc)
      end
    else
      if p - a > 1 do
        find_solutions(a + 1, 1, p, acc)
      else
        acc
      end
    end
  end

  def valid?(a, b, p) do
    :math.pow(a, 2) + :math.pow(b, 2) == :math.pow(p - a - b, 2)
  end
end
