class Quote < ActiveRecord::Base
  has_many :values, :dependent => :destroy
end
