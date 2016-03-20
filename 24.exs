defmodule Perm do
  @arr [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  def find(arr \\ @arr, acc \\ 1)
  def find(arr, 1000000), do: arr |> Enum.join
  def find(arr, acc) do
    new_arr = narayana_next_perm(arr, 10)
    find(new_arr, acc + 1)
  end

  def narayana_next_perm(arr, n) do
    k = calc_k(arr, n - 2)
    if k == -1 do
      0
    else
      t = calc_t(arr, n - 1, k)
      tmp = Enum.at(arr, k)
      arr = List.replace_at(arr, k, Enum.at(arr, t))
      arr = List.replace_at(arr, t, tmp)
      change_sequence(arr, k + 1, n, k)
    end
  end

  defp calc_k(arr, k) do
    if k >= 0 && Enum.at(arr, k) >= Enum.at(arr, k + 1) do
      calc_k(arr, k - 1)
    else
      k
    end
  end

  defp calc_t(arr, t, k) do
    if Enum.at(arr, k) >= Enum.at(arr, t) do
      calc_t(arr, t - 1, k)
    else
      t
    end
  end

  defp change_sequence(arr, i, n, k) do
    if i < Float.ceil((n + k) / 2) do
      t = n + k - i
      tmp = Enum.at(arr, i)
      arr = List.replace_at(arr, i, Enum.at(arr, t))
      arr = List.replace_at(arr, t, tmp)
      change_sequence(arr, i + 1, n, k)
    else
      arr
    end
  end
end
