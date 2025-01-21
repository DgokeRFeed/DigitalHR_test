require 'rails_helper'

RSpec.describe Skills::List do
  subject { described_class.run! }

  before { FactoryBot.create_list(:skill, 3) }

  it 'return 3 records' do
    expect(subject.count).to eq 3
  end
end