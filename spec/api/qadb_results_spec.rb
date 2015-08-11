require 'rails_helper'
require_relative 'api_helpers'

describe 'QadbResults' do
  include ApiHelpers
  describe "GET /api/v1/qadb_results" do
    it "returns qadb_results" do
      result = create(:qadb_result)
      get "/api/qadb_results/#{result.id}"
      json_response = json_parse(response.body)
      expect(response.status).to eq(200)
      expect(json_response["id"]).to eq(result.id)
    end
  end

  describe "POST /api/qadb_results/" do
    it "creates a new qadb_results" do
      result = build(:qadb_result, testsuite: "unit_test")
      post "/api/qadb_results/", qadb_result: result.attributes
      json_response = json_parse(response.body)
      expect(json_response["testsuite"]).to eq("unit_test")
    end
  end
end
