class Patient < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :visits

  def name
    "#{first_name} #{last_name}"
  end
end
