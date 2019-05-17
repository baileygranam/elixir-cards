defmodule Cards do

  @doc """
  Generates a deck of cards.

  ## Examples

      iex> Cards.create_deck()
      ["Ace of Diamonds", "Ace of Hearts", "Ace of Spades", "Ace of Clubs",
      "Two of Diamonds", "Two of Hearts", "Two of Spades", "Two of Clubs",
      "Three of Diamonds", "Three of Hearts", "Three of Spades", "Three of Clubs",
      "Four of Diamonds", "Four of Hearts", "Four of Spades", "Four of Clubs",
      "Five of Diamonds", "Five of Hearts", "Five of Spades", "Five of Clubs",
      "Six of Diamonds", "Six of Hearts", "Six of Spades", "Six of Clubs",
      "Seven of Diamonds", "Seven of Hearts", "Seven of Spades", "Seven of Clubs",
      "Eight of Diamonds", "Eight of Hearts", "Eight of Spades", "Eight of Clubs",
      "Nine of Diamonds", "Nine of Hearts", "Nine of Spades", "Nine of Clubs",
      "Jack of Diamonds", "Jack of Hearts", "Jack of Spades", "Jack of Clubs",
      "King of Diamonds", "King of Hearts", "King of Spades", "King of Clubs",
      "Queen of Diamonds", "Queen of Hearts", "Queen of Spades", "Queen of Clubs"]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Jack", "King", "Queen"]
    suites = ["Diamonds", "Hearts", "Spades", "Clubs"]

    # Get every combination of suites and values
    for value <- values, suit <- suites do
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

end
