require 'spec_helper'
require_relative 'api_helpers'

describe QadbResults do
  include ApiHelpers
  describe "GET /api/v1/qadb_results" do
    it "returns qadb_results" do
      create(:qadb_result)
      get "/api/v1/qadb_results"
      json_response = json_parse(response.body)
      binding.pry
      expect(json_response).to eq("hahah")
    end
  end
end
