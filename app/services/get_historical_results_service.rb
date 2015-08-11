class GetHistoricalResultsService
  def initialize params
    @qadb_result                = QadbResult.new
    @qadb_result.testsuite      = params[:testsuite]
    @qadb_result.succeeded      = params[:succeeded]
    @qadb_result.failed         = params[:failed]
    @qadb_result.skipped        = params[:skipped]
    @qadb_result.internal_error = params[:internal_error]
    @qadb_result.log_url        = params[:log_url]
    @qadb_result.test_date      = params[:test_date]
    @qadb_result.save
  end
end
