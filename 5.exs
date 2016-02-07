defmodule LeastCommonMultiple do
  def calc(n, res \\ 0)
  def calc(1, res), do: IO.puts(res)
  def calc(n, 0) do
    calc(n, n - 1)
  end
  def calc(n, res) do
    calc(n - 1, lcm(res, n - 1))
  end

  # the greatest common divisor
  def gcd(a, 0), do: a
  def gcd(a, b) do
    gcd(b, rem(round(a), b))
  end

  # the least common multiple
  def lcm(a, b) do
    (a * b) / gcd(a, b)
  end
end
