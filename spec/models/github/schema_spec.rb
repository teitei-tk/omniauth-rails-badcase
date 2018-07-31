require 'rails_helper'

RSpec.describe Github::Schema, type: :model do
  let(:schema) {
    {
      provider: "github",
      uid: "abcd2"
    }
  }

  it 'schema is valid' do
    model = described_class.new(schema)
    expect(model.provider).to eq schema[:provider]
    expect(model.uid).to eq schema[:uid]
  end

  context 'schema is OmniAuth::AuthHash' do
    let(:auth_hash_schema) {
      OmniAuth::AuthHash.new(schema)
    }

    it "model is invalid error, raise ActiveRecordForbbidenError" do
      expect{
        described_class.new(auth_hash_schema)
      }.to raise_error(ActiveModel::ForbiddenAttributesError)
    end
  end
end
