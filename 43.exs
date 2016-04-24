defmodule Problem43 do
  def find(c \\ 17)
  def find(1003), do: 0
  def find(c) do
    find(c + 17) + find_d7(c)
  end

  def is_pandigital?(n) do
    n |> int_to_arr |> is_pandigital_arr?
  end

  def is_pandigital_arr?(arr) do
    length(Enum.uniq(arr)) == length(arr)
  end

  def int_to_arr(n) do
    n |> Integer.to_string |> String.codepoints |> Enum.map(&(String.to_integer(&1)))
  end

  def arr_to_int(arr) do
    arr |> Enum.join |> String.to_integer
  end

  def find_d7(c, d7 \\ 0)
  def find_d7(_c, 10), do: 0
  def find_d7(c, d7) do
    arr = if (c / 100) < 1 do
      [d7|[0|[hd(int_to_arr(c))]]]
    else
      [d7|Enum.slice(int_to_arr(c), 0, 2)]
    end
    if is_pandigital_arr?(arr) && rem(arr_to_int(arr), 13) == 0 do
      new_arr = [List.last(int_to_arr(c))|arr |> Enum.reverse] |> Enum.reverse
      if is_pandigital_arr?(new_arr) do
        find_d7(c, d7 + 1) + find_d6(new_arr)
      else
        find_d7(c, d7 + 1)
      end
    else
      find_d7(c, d7 + 1)
    end
  end

  def find_d6(arr, d6 \\ 0)
  def find_d6(_arr, 10), do: 0
  def find_d6(arr, d6) do
    new_arr = [d6|Enum.slice(arr, 0, 2)]
    if is_pandigital_arr?(new_arr) && rem(arr_to_int(new_arr), 11) == 0 && is_pandigital_arr?([d6|arr]) do
      find_d6(arr, d6 + 5) + find_d5([d6|arr])
    else
      find_d6(arr, d6 + 5)
    end
  end

  def find_d5(arr, d5 \\ 0)
  def find_d5(_arr, 10), do: 0
  def find_d5(arr, d5) do
    new_arr = [d5|Enum.slice(arr, 0, 2)]
    if is_pandigital_arr?(new_arr) && rem(arr_to_int(new_arr), 7) == 0 && is_pandigital_arr?([d5|arr]) do
      find_d5(arr, d5 + 1) + find_d4([d5|arr])
    else
      find_d5(arr, d5 + 1)
    end
  end

  def find_d4(arr, d4 \\ 0)
  def find_d4(_arr, 10), do: 0
  def find_d4(arr, d4) do
    new_arr = [d4|Enum.slice(arr, 0, 2)]
    if is_pandigital_arr?(new_arr) && rem(arr_to_int(new_arr), 5) == 0 && is_pandigital_arr?([d4|arr]) do
      find_d4(arr, d4 + 2) + find_d3([d4|arr])
    else
      find_d4(arr, d4 + 2)
    end
  end

  def find_d3(arr, d3 \\ 0)
  def find_d3(_arr, 10), do: 0
  def find_d3(arr, d3) do
    new_arr = [d3|Enum.slice(arr, 0, 2)]
    if is_pandigital_arr?(new_arr) && rem(arr_to_int(new_arr), 3) == 0 && is_pandigital_arr?([d3|arr]) do
      find_d3(arr, d3 + 1) + find_d2([d3|arr])
    else
      find_d3(arr, d3 + 1)
    end
  end

  def find_d2(arr, d2 \\ 0)
  def find_d2(_arr, 10), do: 0
  def find_d2(arr, d2) do
    new_arr = [d2|Enum.slice(arr, 0, 2)]
    if is_pandigital_arr?(new_arr) && rem(arr_to_int(new_arr), 2) && is_pandigital_arr?([d2|arr]) do
      find_d2(arr, d2 + 1) + find_d1([d2|arr])
    else
      find_d2(arr, d2 + 1)
    end
  end

  def find_d1(arr, d1 \\ 0)
  def find_d1(_arr, 10), do: 0
  def find_d1(arr, d1) do
    new_arr = [d1|Enum.slice(arr, 0, 2)]
    if is_pandigital_arr?(new_arr) && is_pandigital_arr?([d1|arr]) do
      arr_to_int([d1|arr])
    else
      find_d1(arr, d1 + 1)
    end
  end
end
