require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "Fill the form with a random word, click the play button, and get a message that the word is not in the grid" do
    visit scores
    assert test: "Not in the grid"
    assert_selector "result", text: "not included in the grid"
  end

  test "Fill the form with a one-letter consonant word, click play, and get a message it's not a valid English word" do
    visit scores
    assert test: "Not english word"
    assert_selector "result", text: "not a real word"
  end

  test "Fill the form with a valid English word, click play and get a 'Congratulations' message" do
    visit scores
    assert test: "Good word"
    assert_selector "result", text: "Well done"
  end
end
