class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
  	def paginate(cursor = 0,limit = 10)
  		self.where("id > ?", cursor).limit(limit)
  	end

  	def prev(cursor = 0,limit = 10)
  		self.where("id < ?", cursor).last(limit)
  	end
  end
end
