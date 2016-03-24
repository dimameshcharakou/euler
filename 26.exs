defmodule Problem26 do
  def find(p \\ 1, acc \\ 0)
  def find(1000, acc), do: IO.puts(acc)
  def find(p, acc) do
    x = rem_by_two_or_five(p)
    if x <= 1 do
      find(p + 1, acc)
    else
      m = rem(1 * 10, x)
      new_period = calc_period(m, x)
      if new_period > acc do
        find(p + 1, p)
      else
        find(p + 1, acc)
      end
    end
  end

  def rem_by_two_or_five(n) do
    if rem(n, 2) == 0 do
      rem_by_two_or_five(round(n / 2))
    else
      if rem(n, 5) == 0 do
        rem_by_two_or_five(round(n / 5))
      else
        n
      end
    end
  end

  def calc_period(m, p, period \\ 1)
  def calc_period(m, p, period) do
    if m > 1 do
      m = rem(m * 10, p)
      calc_period(m, p, period + 1)
    else
      period
    end
  end
end
