defmodule Letter do
  # String.strip(' ')
  # String.length('')
  @mapping [
              { 1, "one" }, { 2, "two" }, { 3, "three" }, { 4, "four" },
              { 5, "five" }, { 6, "six" }, { 7, "seven" }, { 8, "eight" },
              { 9, "nine" }, { 10, "ten" }, { 11, "eleven" }, { 12, "twelve" },
              { 13, "thirteen" }, { 14, "fourteen" }, { 15, "fifteen" },
              { 16, "sixteen" }, { 17, "seventeen" }, { 18, "eighteen" },
              { 19, "nineteen" }, { 20, "twenty" }, { 30, "thirty" },
              { 40, "forty" }, { 50, "fifty" }, { 60, "sixty" },
              { 70, "seventy" }, { 80, "eighty" }, { 90, "ninety" }
           ]
  def calc(n \\ 1, acc \\ 0)
  def calc(1000, acc) do
    last = "onethousand" |> String.length
    IO.puts(acc + last)
  end
  def calc(n, acc) do
    word = @mapping[n]
    if word do
      calc(n + 1, String.length(word) + acc)
    else
      if n < 100 do
        words = two_digit_number(n)
        calc(n + 1, String.length(words) + acc)
      else
        arr = Integer.to_string(n) |> String.codepoints
        if tl(arr) == ["0", "0"] do
          word = @mapping[String.to_integer(hd(arr))]
          calc(n + 1, String.length(word <> "hundred") + acc)
        else
          # 103
          word1 = @mapping[String.to_integer(hd(arr))] <> "hundredand"
          if hd(tl(arr)) == "0" do
            word2 = @mapping[String.to_integer(hd(tl(tl(arr))))]
            calc(n + 1, String.length(word1 <> word2) + acc)
          else
            # 113
            x = Enum.join(tl(arr)) |> String.to_integer
            word2 = @mapping[x]
            if word2 do
              calc(n + 1, String.length(word1 <> word2) + acc)
            else
              words = two_digit_number(tl(arr) |> Enum.join |> String.to_integer)
              calc(n + 1, String.length(word1 <> words) + acc)
            end
          end
        end
      end
    end
  end

  defp two_digit_number(n) do
    arr = Integer.to_string(n) |> String.codepoints
    word1 = @mapping[String.to_integer(hd(arr) <> "0")]
    word2 = @mapping[String.to_integer(tl(arr) |> hd)]
    word1 <> word2
  end
end
