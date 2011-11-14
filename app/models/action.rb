class Action < ActiveRecord::Base

  def self.total_cost
    result = 0
    Action.all.each {|a| result += a.cost}
    result
  end
end
