defmodule Problem33 do
  def find(a \\ 11, b \\ 12, c \\ 12, acc \\ [])
  def find(a, 99, c, acc) do
    find(a + 1, c + 1, c + 1, acc)
  end
  def find(99, _b, _c, acc) do
    numerators_arr = acc |> Enum.map(&(&1 |> hd |> String.to_integer))
    denominators_arr = acc |> Enum.map(&(&1 |> tl |> hd |> String.to_integer))
    multiply(denominators_arr) / multiply(numerators_arr)
  end
  def find(a, b, c, acc) do
    if is_non_trivial?(a, b) do
      fraction = [Integer.to_string(a), Integer.to_string(b)]
      find(a, b + 1, c, [fraction|acc])
    else
      find(a, b + 1, c, acc)
    end
  end

  def is_non_trivial?(a, b, arr \\ [1, 2, 3, 4, 5, 6, 7, 8, 9])
  def is_non_trivial?(_a, _b, []), do: false
  def is_non_trivial?(a, b, [head|tail]) do
    arr_a = to_array(a)
    arr_b = to_array(b)
    if Enum.member?(arr_a, head) && Enum.member?(arr_b, head) do
      x = hd(arr_a -- [head])
      y = hd(arr_b -- [head])
      if x != 0 && y != 0 do
        if a/b == x/y do
          true
        else
          is_non_trivial?(a, b, tail)
        end
      else
        is_non_trivial?(a, b, tail)
      end
    else
      is_non_trivial?(a, b, tail)
    end
  end

  def to_array(n) do
    n
    |> Integer.to_string
    |> String.codepoints
    |> Enum.map(&(String.to_integer(&1)))
  end

  def multiply(arr, acc \\ 1)
  def multiply([], acc), do: acc
  def multiply([head|tail], acc) do
    multiply(tail, head * acc)
  end
end
