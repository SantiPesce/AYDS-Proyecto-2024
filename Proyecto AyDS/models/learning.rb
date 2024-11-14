# frozen_string_literal: true

# clase learning
class Learning < ActiveRecord::Base
  has_one :question
end
