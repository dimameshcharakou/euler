defmodule Palindrom do
  def is_palindrom(n) do
    new = String.to_integer(String.reverse(to_string(n)))
    n == new
  end

  def calc(a \\ 900, b \\ 900, p \\ 0)
  def calc(a, b, p) when a > 999 and b > 999, do: IO.puts(p)
  def calc(a, b, p) when a <= 999 and b > 999, do: calc(a + 1, 900, p)
  def calc(a, b, p) do
    m = a * b
    if is_palindrom(m) do
      if m > p do
        calc(a, b + 1, m)
      else
        calc(a, b + 1, p)
      end
    else
      calc(a, b + 1, p)
    end
  end
end
