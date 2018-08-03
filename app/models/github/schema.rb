class Github::Schema
  include ActiveModel::Model
  include ActiveModel::Attributes

  validates :provider, :uid, presence: true

  attribute :provider, :string
  attribute :uid, :string

  class Info
    include ActiveModel::Model
    include ActiveModel::Attributes

    validates :name, presence: true

    attribute :name, :string
    attribute :email, :string
    attribute :nickname, :string
    attribute :first_name, :string
    attribute :last_name, :string
    attribute :location, :string
    attribute :description, :string
    attribute :image, :string
    attribute :phone, :string

    def urls=(urls)
      @urls = urls
    end

    def urls
      @urls
    end
  end

  class Credentials
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :token, :string
    attribute :secret, :string
    attribute :expires, :boolean, default: false
    attribute :expires_at, :datetime
  end

  def Initialize(attr = {})
    super(attr)
    @info = Github::Schema.Info.new(attr[:info])
    @credentials = Github::Schema.Credentials.new(attr[:credentials])
  end

  def info=(info)
    @info = Github::Schema::Info.new(info)
  end

  def info
    @info
  end

  def credentials=(info)
    @credentials = Github::Schema::Credentials.new(info)
  end

  def credentials
    @credentials
  end
end
