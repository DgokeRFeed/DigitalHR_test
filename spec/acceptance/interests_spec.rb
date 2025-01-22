require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Interests' do
  before { header 'Content-Type', 'application/json' }

  explanation 'Interests resource'

  get '/api/interests' do
    response_field :id, 'ID'
    response_field :name, 'Name of interest'

    before do
      FactoryBot.create_list(:interest, 2)
    end

    example 'Getting list of interests' do
      do_request

      interests = JSON.parse(response_body)
      expect(response_status).to eq 200
      expect(interests.count).to eq 2
    end
  end

  post '/api/interests' do
    let(:raw_post) { params.to_json }

    parameter :name, 'Name of interest'

    response_field :id, 'ID'
    response_field :name, 'Name of interest'

    example 'Create interest' do
      interest_params = {
        interest: {
          name: 'music'
        }
      }

      do_request(interest_params)

      interest = JSON.parse(response_body)
      expect(response_status).to eq 200
      expect(interest['name']).to eq 'music'
    end
  end
end