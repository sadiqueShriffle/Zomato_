# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :restaurents, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one  :cart, dependent: :destroy
  has_many :categories, through: :restaurents
  has_many :dishes, through: :categories
  has_many :cart_items, through: :cart
  has_many :order_items, through: :orders
  has_one_attached :image, dependent: :destroy

  before_save :remove_space

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Invalid email id!!!!' }

  # after_create :create_user_mail

  def create_user_mail
    UserMailer.with(user: self).welcome_email.deliver_later
  end

  def self.from_google(email:, uid: )
    find_or_create_by!(email: email, uid: uid, provider: 'google_oauth2')
  end

  def remove_space
    self.name = name.strip
    self.email = email.strip
  end

  def owner?
    type == 'Owner'
  end

  def customer?
    type == 'Customer'
  end
end
