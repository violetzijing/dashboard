require 'rake'

desc "Get history results from QADB"
task :get_history_results => :environment do
  database = Mysql::new('147.2.207.30', 'root', '', 'qadb')
  result = database.query('select result.succeeded, result.failed, result.skipped, result.internal_error, testsuite.testsuite, tcf_group.log_url, tcf_group.test_date from result left join tcf_group on tcf_group.tcf_id = result.tcf_id left join testsuite on testsuite.testsuite_id = tcf_group.testsuite_id')
  result.each_hash {|n| QadbResult.create(n) }
end