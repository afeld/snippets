class Execution < ActiveRecord::Base
  belongs_to :snippet

  STATUSES = %w(pending running complete).freeze
  validates :status, inclusion: { in: STATUSES }, presence: true

  after_initialize :set_defaults
  after_create :run_later

  def ok?
    self.exit_status.to_i == 0
  end

  def result_message
    self.ok? ? 'OK' : 'ERROR'
  end

  def status_message
    msg = self.status.upcase
    if msg == 'COMPLETE'
      msg << " - #{self.result_message}"
    end

    msg
  end


  private

  def set_defaults
    self.status ||= 'pending'
  end

  def run
    s = Sicuro.eval(self.snippet.code)
    self.stdout = s.stdout
    self.stderr = s.stderr

    # see https://github.com/duckinator/sicuro/issues/28
    self.exit_status = s.stderr.present? ? 1 : 0 # s.return

    self.status = 'complete'
    self.save!
  end

  def run_later
    self.delay.run
  end
end
