class User < ActiveRecord::Base
  has_many :movies
  has_secure_password

  validates :email,  presence: true, confirmation: true, uniqueness: true, email: true
  validates :password, length: {within: 4..20, too_short: "THE LENGTH IS TOO SHORT HOMIE", too_long: "THE LENGTH IS TOO LONG"}

end
