defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Generates a standard 52-card deck as a list of strings.

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

  @doc """
  Shuffles a deck of cards using the Elixir Enum module shuffle function.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.shuffle(deck)
      ["Nine of Hearts", "Queen of Clubs", "Seven of Spades", "Three of Spades",
      "Seven of Clubs", "Eight of Clubs", "Jack of Diamonds", "Two of Hearts",
      "King of Hearts", "Jack of Spades", "Ace of Hearts", "Six of Hearts",
      "Queen of Diamonds", "Four of Spades", "Ace of Spades", "Queen of Spades",
      "Nine of Diamonds", "Six of Clubs", "Six of Diamonds", "Nine of Clubs",
      "Jack of Hearts", "King of Clubs", "Two of Spades", "Seven of Hearts",
      "Three of Clubs", "Five of Clubs", "Eight of Diamonds", "Nine of Spades",
      "King of Diamonds", "Two of Clubs", "Four of Clubs", "Six of Spades",
      "Two of Diamonds", "King of Spades", "Ace of Diamonds", "Ace of Clubs",
      "Four of Hearts", "Queen of Hearts", "Five of Spades", "Eight of Hearts",
      "Jack of Clubs", "Seven of Diamonds", "Three of Diamonds", "Four of Diamonds",
      "Five of Hearts", "Eight of Spades", "Five of Diamonds", "Three of Hearts"]

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Returns `true` if deck contains a given card, otherwise `false`.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains(deck, "Ace of Hearts")
      true
      iex> Cards.contains(deck, "Eleven of Hearts")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should be in the hand.
  Returns a tuple with two lists. The first list contains `number` of cards
  split from the `deck`. The second list contains the remaining `deck` of cards.
  This function utilizes the Elixir Enum module split function.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Diamonds", "Ace of Hearts"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save a `deck` of cards to the specified `filename` for future access.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.save(deck, "deck.txt")
      :ok

  """
  def save(deck, filename) do
    # Convert deck to binary to be saved using erlang
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Load a deck of cards from the specified `filename`. If the file
  does not exist

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.create_hand(deck, 3)
      iex> Cards.save("deck.txt")
      iex> Cards.load("deck.txt")
      ["Three of Hearts", "Seven of Spades", "King of Diamonds"]

      iex> Cards.load("fake_deck.txt")
      "File 'fake_deck.txt' does not exist"

  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File '#{filename}' does not exist"
    end
  end

  @doc """
  Returns a tuple with `{hand, deck}` where hand has `hand_size` number of cards.

  ## Examples

      iex> {hand, _deck} = Cards.hand(2)
      ["Three of Clubs", "Eight of Clubs"]

  """
  def hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
