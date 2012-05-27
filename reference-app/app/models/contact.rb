class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name, presence: true
  validates :last_name, presence: true
end
