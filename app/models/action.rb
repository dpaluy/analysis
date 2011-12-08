class Action < ActiveRecord::Base
  belongs_to :analyzer

  paginates_per 200
end
