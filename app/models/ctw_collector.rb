class CtwCollector < ActiveRecord::Base

  belongs_to :ctw
  
  def get_index_of_max
    values = [pr0, pr1, pr2]
    values.rindex(values.max)
  end
end
