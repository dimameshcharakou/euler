defmodule Problem47 do
  def find(n \\ 210)
  def find(n) do
    if !simple?(n) && !simple?(n + 1) && !simple?(n + 2) && !simple?(n + 3) && valid?(n) && valid?(n + 1) && valid?(n + 2) && valid?(n + 3) do
      IO.puts(n)
    else
      find(n + 1)
    end
  end

  def valid?(n) do
    simple_deviders(n) |> Enum.uniq |> length == 4
  end

  def simple_deviders(n, x \\ 2, acc \\ [])
  def simple_deviders(n, x, acc) do
    if x <= n do
      if rem(round(n), x) == 0 && simple?(x) do
        simple_deviders(n / x, x + 1, [x|acc])
      else
        simple_deviders(n, x + 1, acc)
      end
    else
      acc
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
