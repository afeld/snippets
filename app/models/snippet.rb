class Snippet < ActiveRecord::Base
  has_many :executions, dependent: :destroy

  after_create :execute

  def execute
    self.executions.create!
  end
end
