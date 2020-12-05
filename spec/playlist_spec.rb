require 'rails_helper'
describe "get all playlist route", :type => :request do
  let!(:playlists) { FactoryBot.create(:playlist) }
before {get '/playlists'}
it 'returns all playlists' do
    expect(JSON.parse(response.body).size).to eq(1)
  end
it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end