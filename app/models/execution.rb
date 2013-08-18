class Execution < ActiveRecord::Base
  belongs_to :snippet

  STATUSES = %w(pending running complete).freeze
  validates :status, inclusion: { in: STATUSES }, presence: true

  after_initialize :set_defaults

  private

  def set_defaults
    self.status ||= 'pending'
  end
end
