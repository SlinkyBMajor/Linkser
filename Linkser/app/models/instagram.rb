class Instagram < ActiveRecord::Base
  self.table_name = "instagram"
  validates :name, presence: true
end
