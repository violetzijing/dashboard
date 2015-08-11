module Api
  class QadbResultsController < ApplicationController
    respond_to :json

    def index
      @qadb_results = QadbResult.all
      render json: @qadb_results
    end

    def show
      @qadb_result = QadbResult.find(params[:id])
      render json: @qadb_result
    end

    def new
      @qadb_result = QadbResult.new(result_params)
      
      if @qadb_result.save
        render json: @qadb_result, status: :created
      else
        render json: @qadb_result.errors, status: :unprocessable_entity
      end
    end

    def create
      @qadb_result = QadbResult.new(result_params)

      if @qadb_result.save
        render json: @qadb_result, status: :created
      else
        render json: @qadb_result.errors, status: unprocessable_entity
      end
    end

    def destory
      @qadb_result = QadbResult.find(params[:id])
      @qadb_result.destory

      head :no_content
    end

    private

    def result_params
      params.require(:qadb_result).permit(:testsuite, :succeeded, :failed,
                                          :skipped, :internal_error, :log_url, :test_date)
    end
  end
end
