defmodule Problem49 do
  def find(n \\ 1009)
  def find(9999), do: "failure"
  def find(n) do
    if n != 1487 && simple?(n) do
      check(n)
    else
      find(n + 1)
    end
  end

  def check(n) do
    arr = int_to_array(n)
    check(arr, n, [arr])
  end

  defp check(arr, n, acc) do
    perm = narayana_next_perm(arr, 4)
    if perm == 0 do
      if length(acc) > 2 do
        differences = calc_difference(acc, n)
        check_differences(differences, n, differences)
      else
        find(n + 1)
      end
    else
      check(perm, n, [perm|acc])
    end
  end

  def calc_difference(arr, n, acc \\ [])
  def calc_difference([], _n, acc), do: acc
  def calc_difference([head|tail], n, acc) do
    value = [arr_to_int(head) - n, head]
    calc_difference(tail, n, [value|acc])
  end

  def check_differences(arr, n, original)
  def check_differences([], n, _original), do: find(n + 1)
  def check_differences([head|tail], n, original) do
    values = Enum.filter(original, &((abs(hd(&1) - hd(head)) == hd(head) || hd(&1) - hd(head) == 0) && simple?(Enum.reverse(&1) |> hd |> arr_to_int )))
    if length(values) == 3 do
      values |> Enum.map(&(tl(&1))) |> List.flatten |> Enum.join
    else
      check_differences(tail, n, original)
    end
  end

  def int_to_array(n) do
    n
    |> Integer.to_string
    |> String.codepoints
    |> Enum.map(&(String.to_integer(&1)))
  end

  def arr_to_int(arr) do
    arr |> Enum.join |> String.to_integer
  end

  def simple?(n, i \\ 2)
  def simple?(n, i) do
    if i * i <= n do
      if rem(round(n), i) == 0 do
        false
      else
        simple?(n, i + 1)
      end
    else
      true
    end
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
