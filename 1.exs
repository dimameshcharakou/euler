defmodule Reminder do
  def calc(x, sum \\ 0)
  def calc(x, sum) when x == 0, do: IO.puts(sum)
  def calc(x, sum) do
    x = x - 1
    if rem(x, 3) == 0 || rem(x, 5) == 0 do
      calc(x, sum + x)
    else
      calc(x, sum)
    end
  end
end
