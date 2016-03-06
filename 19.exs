defmodule Calc do
  @normal_year [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  @leap_year [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def find(year \\ 1900, acc \\ 0, days \\ 0)
  def find(2001, acc, _days), do: IO.puts(acc)
  def find(year, acc, days) do
    if (rem(year, 100) == 0 && rem(year, 400) == 0) || (rem(year, 100) != 0 && rem(year, 4) == 0) do
      sundays = count_sundays(@leap_year, days)
      find(year + 1, acc + sundays, days + sum(@leap_year))
    else
      if rem(year, 100) == 0 do
        find(year + 1, acc, days + sum(@normal_year))
      else
        sundays = count_sundays(@normal_year, days)
        find(year + 1, acc + sundays, days + sum(@normal_year))
      end
    end
  end

  defp sum(arr, acc \\ 0)
  defp sum([], acc), do: acc
  defp sum([head|tail], acc) do
    sum(tail, head + acc)
  end

  defp count_sundays(arr, days, acc \\ 0, month \\ 1)
  defp count_sundays([31], _days, acc, _month), do: acc
  defp count_sundays(arr, days, acc, month) do
    if month == 1 do
      if rem((days + 1), 7) == 0 do
        count_sundays(arr, days, acc + 1, month + 1)
      else
        count_sundays(arr, days, acc, month + 1)
      end
    else
      if rem((hd(arr) + days + 1), 7) == 0 do
        count_sundays(tl(arr), days + hd(arr), acc + 1, month + 1)
      else
        count_sundays(tl(arr), days + hd(arr), acc, month + 1)
      end
    end
  end
end
