class Vote < ApplicationRecord
  belongs_to :event
  has_one :vote_category
end
