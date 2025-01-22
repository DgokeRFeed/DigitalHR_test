require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  before { header 'Content-Type', 'application/json' }

  explanation 'Users resource'

  get '/api/users' do
    response_field :name, 'Name'
    response_field :surname, 'Surname'
    response_field :patronymic, 'Patronymic'
    response_field :full_name, 'Full name'
    response_field :email, 'Email address'
    response_field :age, 'Age'
    response_field :country, 'Country'
    response_field :nationality, 'Nationality'
    response_field :gender, 'Gender (`male` or `female`)'
    response_field :interests, 'Array of interests'
    response_field :skills, 'Array of skills'

    before do
      FactoryBot.create(:user)
    end

    example 'Getting list of users' do
      do_request

      users = JSON.parse(response_body)
      expect(response_status).to eq 200
      expect(users.count).to eq 1
    end
  end

  post '/api/users' do
    let(:raw_post) { params.to_json }

    parameter :name, 'Name'
    parameter :surname, 'Surname'
    parameter :patronymic, 'Patronymic'
    parameter :email, 'Email address'
    parameter :age, 'Age'
    parameter :country, 'Country'
    parameter :nationality, 'Nationality'
    parameter :gender, 'Gender (`male` or `female`)'
    parameter :interests, 'Array of interests'
    parameter :skills, 'String of skills'

    response_field :name, 'Name'
    response_field :surname, 'Surname'
    response_field :patronymic, 'Patronymic'
    response_field :full_name, 'Full name'
    response_field :email, 'Email address'
    response_field :age, 'Age'
    response_field :country, 'Country'
    response_field :nationality, 'Nationality'
    response_field :gender, 'Gender (`male` or `female`)'
    response_field :interests, 'Array of interests'
    response_field :skills, 'Array of skills'

    before do
      FactoryBot.create(:interest, name: 'music')
      FactoryBot.create(:skill, name: 'backend')
    end

    example 'Create user' do
      user_params = {
        user: {
          name: 'vladimir',
          surname: 'popov',
          patronymic: 'dmitrievich',
          age: 25,
          gender: 'male',
          country: 'russia',
          nationality: 'komi',
          email: 'shish@shish.com',
          interests: [
              'music',
          ],
          skills: 'backend'
        }
      }

      do_request(user_params)

      user = JSON.parse(response_body)
      expect(response_status).to eq 200
      expect(user['full_name']).to eq 'popov vladimir dmitrievich'
      expect(user['interests'].map{ |e| e['name'] }).to contain_exactly 'music'
      expect(user['skills'].map{ |e| e['name'] }).to contain_exactly 'backend'
    end
  end
end