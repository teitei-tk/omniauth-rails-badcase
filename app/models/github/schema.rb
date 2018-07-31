class Github::Schema
  include ActiveModel::Model
  include ActiveModel::Attributes

  validates :provider, :uid, presence: true

  attribute :provider, :string
  attribute :uid, :string
end
