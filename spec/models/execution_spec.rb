require 'spec_helper'

describe Execution do
  describe '.new' do
    it "should set the status to 'pending'" do
      execution = Execution.new
      execution.status.should eq('pending')
    end
  end
end
