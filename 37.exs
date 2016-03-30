defmodule Problem37 do
  def find(n \\ 11, y \\ 0, sum \\ 0)
  def find(_n, 11, sum), do: IO.puts(sum)
  def find(n, y, sum) do
    if simple?(n) do
      if valid_left_to_right?(n) && valid_right_to_left?(n) do
        find(n + 1, y + 1, sum + n)
      else
        find(n + 1, y, sum)
      end
    else
      find(n + 1, y, sum)
    end
  end

  def valid_left_to_right?(n) do
    arr = int_to_array(n)
    if length(arr) == 1 do
      true
    else
      number = arr |> tl |> array_to_int
      if simple?(number) do
        valid_left_to_right?(number)
      else
        false
      end
    end
  end

  def valid_right_to_left?(n) do
    arr = int_to_array(n) |> Enum.reverse
    if length(arr) == 1 do
      true
    else
      number = arr |> tl |> Enum.reverse |> array_to_int
      if simple?(number) do
        valid_right_to_left?(number)
      else
        false
      end
    end
  end

  def int_to_array(n) do
    n
    |> Integer.to_string
    |> String.codepoints
  end

  def array_to_int(arr) do
    arr
    |> Enum.join
    |> String.to_integer
  end

  def simple?(n, i \\ 2)
  def simple?(1, _i), do: false
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
