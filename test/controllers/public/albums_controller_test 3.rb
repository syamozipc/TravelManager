require 'test_helper'

class Public::AlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_albums_index_url
    assert_response :success
  end

  test "should get show" do
    get public_albums_show_url
    assert_response :success
  end

  test "should get new" do
    get public_albums_new_url
    assert_response :success
  end

  test "should get create" do
    get public_albums_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_albums_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_albums_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_albums_destroy_url
    assert_response :success
  end

  test "should get confirm" do
    get public_albums_confirm_url
    assert_response :success
  end

  test "should get ranking" do
    get public_albums_ranking_url
    assert_response :success
  end

end
