class Element < ActiveRecord::Base
  validates :Name, uniqueness: true
  validates :Number, uniqueness: true
end
