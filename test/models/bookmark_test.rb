require "test_helper"

class BookmarkTest < ActiveSupport::TestCase
  test "title must be present" do
    bookmark = Bookmark.new(title: "", url: "http://example.com")
    assert_not bookmark.valid?
    assert_includes bookmark.errors[:title], "can't be blank"
  end

  test "url must be present" do
    bookmark = Bookmark.new(title: "テスト", url: "")
    assert_not bookmark.valid?
    assert_includes bookmark.errors[:url], "can't be blank"
  end
end
