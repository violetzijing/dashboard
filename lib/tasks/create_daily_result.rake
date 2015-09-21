require 'rake'

desc "Retrive test results from QADB"
task :create_daily_results => :environment do
  database = Mysql::new('147.2.207.30', 'root', '', 'qadb')
  result = database.query('select product.product, `release`.`release`, result.succeeded, result.failed, result.skipped, result.internal_error, result.test_time, testsuite.testsuite, tcf_group.log_url, tcf_group.test_date from result left join tcf_group on tcf_group.tcf_id = result.tcf_id left join testsuite on testsuite.testsuite_id = tcf_group.testsuite_id left join submission on submission.submission_id = tcf_group.submission_id left join product on product.product_id = submission.product_id left join `release` on `release`.release_id = submission.release_id where DATE(tcf_group.test_date) = CURDATE()')
  result.each_hash {|n| QadbResult.create(n) }
end
