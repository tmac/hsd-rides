require 'rails_helper'

RSpec.describe 'Api::V1::Rides', type: :request do
  describe 'GET /api/v1/driver/driver_id/rides' do
    context 'with valid data' do
      let(:driver)    { create(:driver) }
      let!(:rides)    { create_list(:ride, 5) }
      let!(:commutes) { rides.each { |ride| create(:commute, ride: ride, driver: driver) } }

      before do
        get "/api/v1/drivers/#{driver.id}/rides?page=1&per_page=5"
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:success)
      end

      it 'returns the correct meta info and number of rides' do
        body = JSON.parse(response.body)
        meta = body['meta']
        expect(meta['status']).to eq('succeeded')
        expect(meta['total_pages']).to eq(1)
        expect(meta['current_page']).to eq(1)
        expect(body['rides'].length).to eq(rides.count)
      end
    end

    context 'with no rides or driver' do
      before do
        get "/api/v1/drivers/4519/rides"
      end

      it 'returns a bad request response' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns the correct meta info' do
        meta = JSON.parse(response.body)['meta']
        expect(meta['status']).to  eq('failed')
        expect(meta['message']).to eq('no driver or rides found')
      end
    end
  end
end
