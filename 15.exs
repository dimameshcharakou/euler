defmodule TablePath do
  # we need 41 - tops to reach goal then 40 edge
  # all edges will have one of 2 edges 21 or 1
  # that means 20 numbers will be the same
  # then using combinatorics we can calculate
  # the number of combinations
  # calc(40, 20)
  def calc(n, k) do
    factorial(n) / (factorial(k) * factorial(n - k))
  end

  def factorial(n, acc \\ 1)
  def factorial(0, acc), do: acc
  def factorial(n, acc) do
    factorial(n - 1, acc * n)
  end
end
