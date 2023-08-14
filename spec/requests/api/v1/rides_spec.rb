require 'rails_helper'

RSpec.describe "Api::V1::Rides", type: :request do
  describe "GET /index" do
    let(:driver) { Driver.create }

    it "returns http success" do
      get "/api/v1/drivers/#{driver.id}/rides"
      expect(response).to have_http_status(:success)
    end
  end

end
