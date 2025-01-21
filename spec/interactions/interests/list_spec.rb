require 'rails_helper'

RSpec.describe Interests::List do
  subject { described_class.run! }

  before { FactoryBot.create_list(:interest, 3) }

  it 'return 3 records' do
    expect(subject.count).to eq 3
  end
end