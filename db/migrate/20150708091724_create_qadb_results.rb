class CreateQadbResults < ActiveRecord::Migration
  def change
    create_table :qadb_results do |t|
      t.string   :testsuite,      null: false
      t.integer  :succeeded,      null: false, default: 0
      t.integer  :failed,         null: false, default: 0
      t.integer  :skipped,        null: false, default: 0
      t.integer  :internal_error, null: false, default: 0
      t.string   :log_url,        null: false
      t.datetime :test_date,      null: false
    end
  end
end
