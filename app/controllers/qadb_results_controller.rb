class QadbResultsController < ApplicationController
  def new
    @qadb_result = QadbResult.new
  end

  def create
    QadbResult.create(result_params)
  end

  def show
    @qadb_result = QadbResult.find(params[:id])
  end

  private

  def result_params
    params.require(:qadb_result).permit(:testsuite, :succeeded, :failed,
                                        :skipped, :internal_error, :log_url, :test_date)
  end
end
