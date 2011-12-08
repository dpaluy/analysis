class CtwCollector < ActiveRecord::Base

  belongs_to :ctw
  
  paginates_per 3000
    
  def get_index_of_max
    values = [pr0, pr1, pr2]
    values.rindex(values.max)
  end
end
