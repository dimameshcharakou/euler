defmodule Delitel do
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

  def search(n, i \\ 2)
  def search(n, i) do
    if simple(i) do
      if rem(round(n), i) == 0 do
        new = n / i
        if simple(new) do
          IO.puts(new)
        else
          search(new)
        end
      else
        search(n, i + 1)
      end
    else
      search(n, i + 1)
    end
  end
end
