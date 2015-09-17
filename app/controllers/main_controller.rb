class MainController < ApplicationController
  def index
    render :index
  end

  def show
    @qadb_results = QadbResult.all
    @qadb_results_testsuite      = @qadb_results.select('testsuite').distinct
    @qadb_results_succeeded      = @qadb_results.group(:testsuite).average(:succeeded)
    @qadb_results_failed         = @qadb_results.group(:testsuite).average(:failed)
    @qadb_results_skipped        = @qadb_results.group(:testsuite).average(:skipped)
    @qadb_results_internal_error = @qadb_results.group(:testsuite).average(:internal_error)
    @qadb_results_last_update    = @qadb_results.group(:testsuite).maximum(:test_date)

    @results_list = []
    n = 1
    @qadb_results_testsuite.each do |item|
      result_hash = {}

      result_hash['id'] = n
      result_hash['testsuite']      = item.testsuite
      result_hash['succeeded']      = @qadb_results_succeeded[item.testsuite].to_f
      result_hash['failed']         = @qadb_results_failed[item.testsuite].to_f
      result_hash['skipped']        = @qadb_results_skipped[item.testsuite].to_f
      result_hash['internal_error'] = @qadb_results_internal_error[item.testsuite].to_f
      result_hash['last_update']    = @qadb_results_last_update[item.testsuite]

      @results_list.push(result_hash)
      n += 1
    end

    render :show
  end

  def test
    render :test
  end
end
