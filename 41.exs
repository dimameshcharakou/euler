defmodule Problem41 do
  def find(n \\ 7654321)
  def find(n) do
    arr = n |> Integer.to_string |> String.codepoints
    x_arr = narayana_prev_perm(arr, 7)
    x = x_arr |> Enum.join |> String.to_integer
    if simple?(x) && pandigital?(x_arr) do
      IO.puts(x)
    else
      find(x)
    end
  end

  def pandigital?(arr) do
    length(arr) == length(Enum.uniq(arr))
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

  def narayana_prev_perm(arr, n) do
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
    if k >= 0 && Enum.at(arr, k) <= Enum.at(arr, k + 1) do
      calc_k(arr, k - 1)
    else
      k
    end
  end

  defp calc_t(arr, t, k) do
    if Enum.at(arr, k) <= Enum.at(arr, t) do
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
