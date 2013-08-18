require 'spec_helper'

describe Snippet do
  describe '.create' do
    it "should create a new Execution" do
      snippet = Snippet.create!(code: '1+1')
      snippet.executions.size.should eq(1)
    end
  end
end
