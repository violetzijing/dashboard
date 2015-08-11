class QadbResult < ActiveRecord::Base
  validates :testsuite,      presence: true
  validates :succeeded,      presence: true
  validates :failed,         presence: true
  validates :skipped,        presence: true
  validates :internal_error, presence: true
  validates :log_url,        presence: true
  validates :test_date,      presence: true
end
