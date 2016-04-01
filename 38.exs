defmodule Problem38 do
  @arr [1, 2, 3, 4, 5, 6, 7, 8, 9]
  def find(n \\ 2, acc \\ 0)
  def find(9876, acc), do: IO.puts(acc)
  def find(n, acc) do
    new_arr = check(n) |> Enum.reverse
    if valid?(new_arr) && arr_to_int(new_arr) > acc do
      find(n + 1, arr_to_int(new_arr))
    else
      find(n + 1, acc)
    end
  end

  def arr_to_int(arr) do
    arr |> Enum.join |> String.to_integer
  end

  def split_by_digit(arr) do
    arr |> Enum.join |> String.codepoints
  end

  def valid?(arr) do
    splitted = arr |> split_by_digit
    length(splitted) == length(Enum.uniq(splitted)) && !Enum.member?(splitted, "0")
  end

  def check(n, arr \\ @arr, acc \\ [])
  def check(_n, [], acc), do: acc
  def check(n, [head|tail], acc) do
    x = split_by_digit([n * head|acc])
    if length(x) == 9 do
      [n * head|acc]
    else
      if length(x) > 9 do
        acc
      else
        check(n, tail, [n * head|acc])
      end
    end
  end
end
