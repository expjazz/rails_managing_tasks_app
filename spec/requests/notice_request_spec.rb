require 'rails_helper'

RSpec.describe "Notices", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/notice/create"
      expect(response).to have_http_status(:success)
    end
  end

end
