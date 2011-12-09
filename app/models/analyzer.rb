class Analyzer < ActiveRecord::Base
  has_many :actions, :dependent => :destroy
  
  belongs_to :ctw
  
  paginates_per 15
  
  validates :start_date, :date => { :before => Time.now }
    
  validates :end_date,
    :date => { :after => :start_date, :before => Time.now + 1.day } 

#  after_save :fill_actions
  
  def total
    last_asset = self.actions.order("timestamp ASC").last
    self.actions.sum(:cost) + (last_asset.amount * last_asset.cost.abs)
  end
  
end
