class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.paginate(condition: {cart_id: 1}, limit: 10, cursor: 1)
  	page = self.where(condition).sort_by("created_at").first(limit+1)
  	page.last = cursor
  end
end
