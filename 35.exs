defmodule Problem35 do
  def find(n \\ 2, acc \\ 0)
  def find(1000000, acc), do: IO.puts(acc)
  def find(n, acc) do
    if simple(n) do
      arr = to_array(n)
      if length(arr) == 1 do
        find(n + 1, acc + 1)
      else
        if is_circular_prime?(arr, arr) do
          find(n + 1, acc + 1)
        else
          find(n + 1, acc)
        end
      end
    else
      find(n + 1, acc)
    end
  end

  def is_circular_prime?(arr, base) do
    n = arr_to_integer(arr)
    if simple(n) do
      new_arr = next_circular_perm(arr)
      if new_arr == base do
        true
      else
        is_circular_prime?(new_arr, base)
      end
    else
      false
    end
  end

  def next_circular_perm(arr) do
    reversed_arr = arr |> Enum.reverse
    last_el = hd(reversed_arr) # 7
    [last_el|reversed_arr |> tl |> Enum.reverse]
  end

  def arr_to_integer(arr) do
    arr |> Enum.join |> String.to_integer
  end

  def to_array(n) do
    n
    |> Integer.to_string
    |> String.codepoints
    |> Enum.map(&(String.to_integer(&1)))
  end

  def simple(n, i \\ 2)
  def simple(n, i) do
    if i <= :math.sqrt(n) do
      if rem(round(n), i) == 0 do
        false
      else
        simple(n, i + 1)
      end
    else
      true
    end
  end
end
