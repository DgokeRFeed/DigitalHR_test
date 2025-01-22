require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Skills' do
  before { header 'Content-Type', 'application/json' }

  explanation 'Skills resource'

  get '/api/skills' do
    response_field :id, 'ID'
    response_field :name, 'Name of skill'

    before do
      FactoryBot.create_list(:skill, 2)
    end

    example 'Getting list of skills' do
      do_request

      skills = JSON.parse(response_body)
      expect(response_status).to eq 200
      expect(skills.count).to eq 2
    end
  end

  post '/api/skills' do
    let(:raw_post) { params.to_json }

    parameter :name, 'Name of skill'

    response_field :id, 'ID'
    response_field :name, 'Name of skill'

    example 'Create skill' do
      skill_params = {
        skill: {
          name: 'backend'
        }
      }

      do_request(skill_params)

      skill = JSON.parse(response_body)
      expect(response_status).to eq 200
      expect(skill['name']).to eq 'backend'
    end
  end
end