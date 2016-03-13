defmodule Names do
  @alphabet_score [
                   {"A", 1}, {"B", 2}, {"C", 3}, {"D", 4},
                   {"E", 5}, {"F", 6}, {"G", 7}, {"H", 8},
                   {"I", 9}, {"J", 10}, {"K", 11}, {"L", 12},
                   {"M", 13}, {"N", 14}, {"O", 15}, {"P", 16},
                   {"Q", 17}, {"R", 18}, {"S", 19}, {"T", 20},
                   {"U", 21}, {"V", 22}, {"W", 23}, {"X", 24},
                   {"Y", 25}, {"Z", 26}
                  ]
  def calc do
    { :ok, names } = File.read("p022_names.txt")
    names_array = names
                  |> String.replace("\"", "")
                  |> String.split(",")
                  |> Enum.sort
    check(names_array)
  end

  def check(arr, pos \\ 1, acc \\ 0)
  def check([], _pos, acc), do: IO.puts(acc)
  def check([head|tail], pos, acc) do
    check(tail, pos + 1, scores(head) * pos + acc)
  end

  def scores(name) do
    name
    |> String.codepoints
    |> letters_scores
  end

  def letters_scores(arr, acc \\ 0)
  def letters_scores([], acc), do: acc
  def letters_scores([head|tail], acc) do
    letters_scores(tail, @alphabet_score[head] + acc)
  end
end
