FactoryGirl.define do
  factory :qadb_result do |qadb_result|
    sequence(:id)             {|n| n }
    sequence(:testsuite)      {|n| "testsuite-#{n}" }
    sequence(:succeeded)      {|n| n + 1 }
    sequence(:failed)         {|n| n + 3 }
    sequence(:skipped)        {|n| n * 2 - 1 }
    sequence(:internal_error) {|n| n * 3 - 1 }
    sequence(:log_url)        {|n| "log-#{n}" }
    test_date                 Time.now.to_s
  end
end
