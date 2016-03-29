defmodule Problem36 do
  def find(n \\ 1, acc \\ 0)
  def find(1000000, acc), do: IO.puts(acc)
  def find(n, acc) do
    x = Integer.digits(n, 2)
    if is_palindrom?(to_array(n)) && is_palindrom?(x) do
      find(n + 1, acc + n)
    else
      find(n + 1, acc)
    end
  end

  def is_palindrom?(arr) do
    arr == Enum.reverse(arr)
  end

  def to_array(n) do
    n
    |> Integer.to_string
    |> String.codepoints
    |> Enum.map(&(String.to_integer(&1)))
  end
end
