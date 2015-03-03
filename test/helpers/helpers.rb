require_relative "../test_helper"

describe "#find_file_with" do

  it "returns false with no params" do
    Helpers.find_file_with().must_equal false
  end

  describe "with short_id argument" do
    it "returns false when it can't find a post with that short_id" do
    end
  end
end