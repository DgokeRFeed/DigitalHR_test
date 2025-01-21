require 'rails_helper'

RSpec.describe Users::Create do
  subject(:user_create) { described_class.run(params) }

  before do
    FactoryBot.create(:interest, name: 'music')
    FactoryBot.create(:interest, name: 'games')

    FactoryBot.create(:skill, name: 'frontend')
    FactoryBot.create(:skill, name: 'backend')
  end

  context 'when params is valid' do
    let(:params) do
      {
        name: 'gugu',
        surname: 'gaga',
        patronymic: 'gigi',
        email: 'cheburek@shish.lol',
        age: 25,
        gender: 'male',
        country: 'tatarstan',
        nationality: 'ultratatar',
        interests: %w[music games],
        skills: 'frontend,backend'
      }
    end

    it 'return new user' do
      expect(subject.valid?).to eq true
      expect(subject.result.class.name).to eq 'User'
    end

    it 'create correct full name' do
      expect(subject.result.full_name).to eq 'gaga gugu gigi'
    end

    it 'add correct interests' do
      interests = subject.result.interests.pluck(:name)

      expect(interests).to contain_exactly('music', 'games')
    end

    it 'add correct skills' do
      skills = subject.result.skills.pluck(:name)

      expect(skills).to contain_exactly('backend', 'frontend')
    end
  end

  context 'when param is wrong type' do
    let(:params) do
      {
        name: 424242,
        surname: 'gaga',
        patronymic: 'gigi',
        email: 'cheburek@shish.lol',
        age: 25,
        gender: 'male',
        country: 'tatarstan',
        nationality: 'ultratatar',
        interests: %w[music games],
        skills: 'frontend,backend'
      }
    end

    it 'return error' do
      expect(subject.valid?).to eq false
      expect(subject.errors.messages[:name]).to eq(['is not a valid string'])
    end
  end

  context 'when param is missing' do
    let(:params) do
      {
        surname: 'gaga',
        patronymic: 'gigi',
        email: 'cheburek@shish.lol',
        age: 25,
        gender: 'male',
        country: 'tatarstan',
        nationality: 'ultratatar',
        interests: %w[music games],
        skills: 'frontend,backend'
      }
    end

    it 'return error' do
      expect(subject.valid?).to eq false
      expect(subject.errors.messages[:name]).to eq(['is required'])
    end
  end

  context 'when param is missing' do
    let(:params) do
      {
        name: '',
        surname: 'gaga',
        patronymic: 'gigi',
        email: 'cheburek@shish.lol',
        age: 25,
        gender: 'male',
        country: 'tatarstan',
        nationality: 'ultratatar',
        interests: %w[music games],
        skills: 'frontend,backend'
      }
    end

    it 'return error' do
      expect(subject.valid?).to eq false
      expect(subject.errors.messages[:name]).to eq(["can't be blank"])
    end
  end

  context 'when params is invalid' do
    context 'age out of range' do
      let(:params) do
        {
          name: 'gugu',
          surname: 'gaga',
          patronymic: 'gigi',
          email: 'cheburek@shish.lol',
          age: 120,
          gender: 'male',
          country: 'tatarstan',
          nationality: 'ultratatar',
          interests: %w[music games],
          skills: 'frontend,backend'
        }
      end

      it 'return not valid object' do
        expect(subject.valid?).to eq false
      end
    end

    context 'gender is invalid' do
      let(:params) do
        {
          name: 'gugu',
          surname: 'gaga',
          patronymic: 'gigi',
          email: 'cheburek@shish.lol',
          age: 25,
          gender: 'combat helicopter',
          country: 'tatarstan',
          nationality: 'ultratatar',
          interests: %w[music games],
          skills: 'frontend,backend'
        }
      end

      it 'return not valid object' do
        expect(subject.valid?).to eq false
      end
    end

    context 'user with same email already exist' do
      let(:params) do
        {
          name: 'gugu',
          surname: 'gaga',
          patronymic: 'gigi',
          email: 'cheburek@shish.lol',
          age: 25,
          gender: 'male',
          country: 'tatarstan',
          nationality: 'ultratatar',
          interests: %w[music games],
          skills: 'frontend,backend'
        }
      end

      before { FactoryBot.create(:user, email: 'cheburek@shish.lol') }

      it 'return not valid object' do
        expect(subject.valid?).to eq false
      end
    end
  end
end