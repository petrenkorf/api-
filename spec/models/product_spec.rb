# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { described_class.create(params) }
  let(:name) { 'Sample Product' }
  let(:pos_code) { 'P123' }
  let(:description) { 'Sample Description' }
  let(:disabled_at) { true }
  let(:params) do
    {
      name:,
      pos_code:,
      description:,
      disabled_at:
    }
  end

  it { instance_of? Product }
  it { expect(subject.name).to eq 'Sample Product' }
  it { expect(subject.pos_code).to eq 'P123' }
  it { expect(subject.description).to eq 'Sample Description' }
  it { expect(subject.disabled_at).to be_nil }

  shared_examples 'is invalid' do
    it { expect(subject).to be_valid }
  end

  describe 'invalid input' do
    context 'when name above 100 characters length' do
      let(:name) { 'abc' * 1000 }

      it { expect(subject).not_to be_valid }
    end

    context 'pos_code exists in database' do
      before { described_class.create(params) }

      it { expect(subject).not_to be_valid }
    end
  end

  describe '#disabled?' do
    it { expect(subject).not_to be_disabled }

    context 'when not nil' do
      let(:disabled_at) { DateTime.now }

      it { expect(subject).to be_disabled }
    end
  end
end
