defmodule PlayingCards do
  @ranks ~w(A 2 3 4 5 6 7 8 9 T J Q K)
  @suits ~w(C D H S)
  @deck for s <- @suits, r <- @ranks, do: r <> s

  @alphabet ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  @base 27

  # ---------- Public API ----------

  def encode(message) do
    n = message_to_int(message)
    index_to_perm(n, @deck)
  end

  def decode(deck) do
    n = perm_to_index(deck, @deck)
    int_to_message(n)
  end

  # ---------- Message <-> Integer ----------

  defp message_to_int(message) do
    message
    |> String.upcase()
    |> String.to_charlist()
    |> Enum.reduce(0, fn ch, acc ->
      acc * @base + char_value(ch)
    end)
  end

  defp char_value(? ), do: 0
  defp char_value(ch) when ch in ?A..?Z, do: ch - ?A + 1

  defp int_to_message(0), do: ""

  defp int_to_message(n) do
    digits =
      Stream.unfold(n, fn
        0 -> nil
        x -> {rem(x, @base), div(x, @base)}
      end)
      |> Enum.to_list()
      |> Enum.reverse()

    digits
    |> Enum.map(&digit_to_char/1)
    |> to_string()
  end

  defp digit_to_char(0), do: ?\s
  defp digit_to_char(d), do: ?A + d - 1

  # ---------- Integer <-> Permutation (Lehmer / factorial system) ----------

  defp index_to_perm(n, deck) do
    len = length(deck)
    facts = factorials(len)
    do_index_to_perm(n, deck, facts)
  end

  defp do_index_to_perm(_n, [], _facts), do: []

  defp do_index_to_perm(n, deck, [f | facts]) do
    idx = div(n, f)
    n2 = rem(n, f)
    {card, rest} = List.pop_at(deck, idx)
    [card | do_index_to_perm(n2, rest, facts)]
  end

  defp perm_to_index(perm, deck) do
    len = length(deck)
    facts = factorials(len)
    do_perm_to_index(perm, deck, facts, 0)
  end

  defp do_perm_to_index([], _deck, _facts, acc), do: acc

  defp do_perm_to_index([card | rest], deck, [f | facts], acc) do
    idx = Enum.find_index(deck, &(&1 == card))
    deck_rest = List.delete_at(deck, idx)
    acc2 = acc + idx * f
    do_perm_to_index(rest, deck_rest, facts, acc2)
  end
defp factorials(n) do
  # (n-1)! down to 0!
  Enum.scan(1..(n - 1), 1, &(&1 * &2))
  |> Enum.reverse()
  |> Kernel.++([1])
end
end

# defmodule TestSuite do
#    use ExUnit.Case
#    
#    describe "Basic Tests" do
#        test "encode and decode from and to \"A\"" do
#            message1 = "A"
#            deck1 = [
#                "AC","2C","3C","4C","5C","6C","7C","8C","9C","TC","JC","QC","KC",
#                "AD","2D","3D","4D","5D","6D","7D","8D","9D","TD","JD","QD","KD",
#                "AH","2H","3H","4H","5H","6H","7H","8H","9H","TH","JH","QH","KH",
#                "AS","2S","3S","4S","5S","6S","7S","8S","9S","TS","JS","KS","QS"
#            ]
#            assert PlayingCards.encode(message1) == deck1,"The message \"A\" corresponds to the second permutation of the deck of cards (its numeric value is equal to 1)"
#            assert PlayingCards.decode(deck1) == message1,"This deck represents the second permutation of its cards (its numeric value is equal to 1), so the returned message should have been \"A\""
#        end
#        
#        test "encode from \"ATTACK TONIGHT ON CODEWARS\"" do
#            message2 = "ATTACK TONIGHT ON CODEWARS"
#            deck2 = [
#                "AC","2C","3C","4C","5C","6C","7C","8C","9C","TC","JC","QC","KC",
#                "AD","2D","3D","4D","5D","6D","JD","9D","7S","9S","QD","5S","TH",
#                "7D","TS","QS","2H","JS","6H","3S","6S","TD","8S","2S","8H","7H",
#                "4S","4H","3H","5H","AS","KH","QH","9H","KD","KS","JH","8D","AH"
#            ]
#            assert PlayingCards.encode(message2) == deck2
#        end
#        
#        test "decode to \"ATTACK APPROVED\"" do
#            message3 = "ATTACK APPROVED"
#            deck3 = [
#                "AC","2C","3C","4C","5C","6C","7C","8C","9C","TC","JC","QC","KC",
#                "AD","2D","3D","4D","5D","6D","7D","8D","9D","TD","JD","QD","KD",
#                "AH","2H","3H","4H","8H","9S","3S","2S","8S","TS","QS","9H","7H",
#                "KH","AS","JH","4S","KS","JS","5S","TH","7S","6S","5H","QH","6H"
#            ]
#            assert PlayingCards.decode(deck3) == message3
#        end
#    end
#end
