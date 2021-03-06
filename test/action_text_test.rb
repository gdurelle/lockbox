require_relative "test_helper"

class ActionTextTest < Minitest::Test
  def setup
    skip unless defined?(ActionText)
  end

  def test_create
    user = User.create!(content: "hi")
    assert_equal "<div class=\"trix-content\">\n  hi\n</div>\n", user.content.body.to_s
  end

  # if encrypted, the ciphertext will change when the content is the same
  def test_encrypted
    user = User.create!(content: "hi")
    original_ciphertext = user.content.body_ciphertext
    user.update!(content: "hi")
    refute_equal user.content.body_ciphertext, original_ciphertext
  end
end
