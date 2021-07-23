require "spec_helper"

describe Cavendish do
  before do
    helper_example
  end

  it "has a version number" do
    expect(Cavendish::VERSION).not_to be nil
  end
end
