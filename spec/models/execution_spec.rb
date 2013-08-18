require 'spec_helper'

describe Execution do
  describe '.create' do
    it "should set the status to 'pending'" do
      execution = Execution.create!
      execution.status.should eq('pending')
    end
  end
end
