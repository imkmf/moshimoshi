class User < ActiveRecord::Base
  before_create :set_hash
  before_save :set_hash

  extend FriendlyId
  friendly_id :username, use: [:slugged, :history]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :email_hash, :username, :password, :password_confirmation, :remember_me
  attr_accessible :bio

  validates_length_of :bio, minimum: 10, maximum: 140, allow_blank: true

  def set_hash
    self.email_hash = Digest::MD5.hexdigest(self.email)
  end
end
