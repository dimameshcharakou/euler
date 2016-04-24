defmodule Problem46 do
  def find(n \\ 2)
  def find(n) do
    if simple?(n) || even?(n) do
      find(n + 1)
    else
      if valid?(n) do
        find(n + 1)
      else
        IO.puts(n)
      end
    end
  end

  def even?(n) do
    rem(n, 2) == 0
  end

  def valid?(n, x \\ 1)
  def valid?(n, x) do
    y = n - 2 * :math.pow(x, 2)
    if y >= 0 do
      if simple?(y) do
        true
      else
        valid?(n, x + 1)
      end
    else
      false
    end
  end

  def simple?(n, i \\ 2)
  def simple?(n, i) do
    if i <= :math.sqrt(n) do
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
