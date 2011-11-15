class Action < ActiveRecord::Base
  belongs_to :analyzer

  def self.total_cost(analyzer_id)
    result = 0
    Action.where("analyzer_id = ?", analyzer_id).each {|a| result += a.cost}
    result
  end
end
