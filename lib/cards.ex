defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Generates a standard 52-card deck as a list of strings.

  ## Examples

      iex> length(Cards.create_deck)
      52

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "King", "Queen"]
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
      iex> shuffled_deck = Cards.shuffle(deck)
      iex> deck != shuffled_deck
      true

  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Returns `true` if deck contains a given card, otherwise `false`.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Hearts")
      true
      iex> Cards.contains?(deck, "Eleven of Hearts")
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
      iex> {hand, _deck} = Cards.deal(deck, 2)
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

      iex> {hand, _deck} = Cards.hand(3)
      iex> Cards.save(hand, "deck.txt")
      iex> deck = Cards.load("deck.txt")
      iex> length(deck)
      3

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
      iex> length(hand)
      2

  """
  def hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
