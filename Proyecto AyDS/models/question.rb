class Question < ActiveRecord::Base
    belongs_to :learning
    has_many :options
end
