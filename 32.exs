defmodule Problem32 do
  def find(a \\ 1, b \\ 12, acc \\ [])
  def find(98, _b, acc) do
    acc |> Enum.uniq |> Enum.sum
  end
  def find(a, 9876, acc) do
    find(a + 1, 12, acc)
  end
  def find(a, b, acc) do
    arr_a = to_array(a)
    arr_b = to_array(b)
    if is_uniq(arr_a ++ arr_b) do
      product = a * b
      product_arr = to_array(product)
      arr = product_arr ++ arr_a ++ arr_b
      if is_uniq(arr) && length(arr) == 9 && !Enum.member?(arr, "0") do
        find(a, b + 1, [product|acc])
      else
        find(a, b + 1, acc)
      end
    else
      find(a, b + 1, acc)
    end
  end

  def is_uniq(arr) do
    uniq_arr = arr |> Enum.uniq
    length(arr) == length(uniq_arr)
  end

  def to_array(n) do
    n |> Integer.to_string |> String.codepoints
  end
end
