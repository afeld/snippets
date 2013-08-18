require 'spec_helper'

describe Snippet do
  describe '.create' do
    let(:snippet) { Snippet.create!(code: 'puts 1+1') }
    let(:execution) { snippet.executions.first }

    it "should create a new Execution" do
      snippet.executions.size.should eq(1)
    end

    it "should execute the code" do
      execution.status.should eq('complete')
      execution.exit_status.should eq(0)
      execution.stdout.should eq("2\n")
      execution.stderr.should be_blank
    end
  end
end
