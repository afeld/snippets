class Snippet < ActiveRecord::Base
  has_many :executions, dependent: :destroy

  after_create :execute

  def execute
    self.executions.create!
  end

  def last_execution
    self.executions.order(created_at: :desc).first
  end
end
