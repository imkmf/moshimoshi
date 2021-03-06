class User < ActiveRecord::Base

  before_create :set_hash
  before_save :set_hash

  extend FriendlyId
  friendly_id :username, use: [:slugged, :history]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :email_hash, :want_email, :username, :password, :password_confirmation, :remember_me
  attr_accessible :bio

  validates_presence_of :username
  validate :password, presence: true, allow_blank: true
  validates_length_of :bio, maximum: 140, allow_blank: true

  def to_s
    self.username
  end

  def set_hash
    self.email_hash = Digest::MD5.hexdigest(self.email)
  end
end
