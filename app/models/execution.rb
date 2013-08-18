class Execution < ActiveRecord::Base
  belongs_to :snippet

  STATUSES = %w(pending running complete).freeze
  validates :status, inclusion: { in: STATUSES }, presence: true

  after_initialize :set_defaults
  after_create :run_later

  private

  def set_defaults
    self.status ||= 'pending'
  end

  def run
    s = Sicuro.eval(self.snippet.code)
    self.stdout = s.stdout
    self.stderr = s.stderr

    # see https://github.com/duckinator/sicuro/issues/28
    self.exit_status = s.stderr.presence ? 1 : 0 # s.return

    self.status = 'complete'
    self.save!
  end

  def run_later
    self.delay.run
  end
end
