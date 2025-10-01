require "test_helper"

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should show success flash on create" do
    assert_difference("Bookmark.count", 1) do
      post bookmarks_url, params: { bookmark: { title: "フラッシュテスト", url: "http://test.com" } }
    end
    assert_redirected_to bookmarks_url
    follow_redirect!
    assert_select ".flash-success", "登録しました"
  end

  test "should show error flash on invalid create" do
    assert_no_difference("Bookmark.count") do
      post bookmarks_url, params: { bookmark: { title: "", url: "" } }
    end
    assert_response :unprocessable_entity
    assert_select ".flash-danger"
  end
end
