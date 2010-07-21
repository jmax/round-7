class Event < ActiveRecord::Base
  validates_presence_of   :title, :description
  validates_uniqueness_of :title

  def finished?
    finished_on && finished_on <= Date.today
  end
end

