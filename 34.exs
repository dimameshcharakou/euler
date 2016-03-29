defmodule Problem34 do
  def find(a \\ 3, acc \\ 0)
  def find(2540160, acc), do: IO.puts(acc)
  def find(a, acc) do
    arr = a
          |> Integer.to_string
          |> String.codepoints
          |> Enum.map(&(String.to_integer(&1)))
    if a == sum_factorials(arr) do
      find(a + 1, a + acc)
    else
      find(a + 1, acc)
    end
  end

  def sum_factorials(arr, acc \\ 0)
  def sum_factorials([], acc), do: acc
  def sum_factorials([head|tail], acc) do
    sum_factorials(tail, factorial(head) + acc)
  end

  def factorial(1), do: 1
  def factorial(0), do: 1
  def factorial(n) do
    n * factorial(n - 1)
  end
end
