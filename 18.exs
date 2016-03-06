defmodule Calc do
  @arr [
         [75],
         [95, 64],
         [17, 47, 82],
         [18, 35, 87, 10],
         [20, 04, 82, 47, 65],
         [19, 01, 23, 75, 03, 34],
         [88, 02, 77, 73, 07, 63, 67],
         [99, 65, 04, 28, 06, 16, 70, 92],
         [41, 41, 26, 56, 83, 40, 80, 70, 33],
         [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
         [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
         [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
         [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
         [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
         [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]
       ]
  # n - amount of lines - 1
  def find(arr \\ @arr, acc \\ [], n \\ 14)
  def find([], acc, _n), do: IO.puts(acc[{0, 0}])
  def find(arr, acc, n) do
    reversed_arr = Enum.reverse(arr)
    acc = check_line(hd(reversed_arr), acc, n)
    find(tl(reversed_arr) |> Enum.reverse, acc, n - 1)
  end

  defp check_line(line, acc, n, m \\ 0)
  defp check_line([], acc, _n, _m), do: acc
  defp check_line(line, acc, n, m) do
    a = acc[{n + 1, m}]
    b = acc[{n + 1, m + 1}]
    if a && b do
      sum = hd(line) + max(a, b)
    else
      sum = hd(line)
    end
    check_line(tl(line), [{{n, m}, sum}|acc], n, m + 1)
  end
end
