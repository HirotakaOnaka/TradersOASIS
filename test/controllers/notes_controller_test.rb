require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note = notes(:one)
  end

  test "should get index" do
    get notes_url
    assert_response :success
  end

  test "should get new" do
    get new_note_url
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post notes_url, params: { note: { comment: @note.comment, contract_date: @note.contract_date, contract_rate: @note.contract_rate, entry_date: @note.entry_date, image1: @note.image1, image2: @note.image2, lot: @note.lot, pair: @note.pair, pips: @note.pips, score: @note.score, trading_method: @note.trading_method } }
    end

    assert_redirected_to note_url(Note.last)
  end

  test "should show note" do
    get note_url(@note)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_url(@note)
    assert_response :success
  end

  test "should update note" do
    patch note_url(@note), params: { note: { comment: @note.comment, contract_date: @note.contract_date, contract_rate: @note.contract_rate, entry_date: @note.entry_date, image1: @note.image1, image2: @note.image2, lot: @note.lot, pair: @note.pair, pips: @note.pips, score: @note.score, trading_method: @note.trading_method } }
    assert_redirected_to note_url(@note)
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end
end
