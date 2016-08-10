class Site < ActiveRecord::Base
  self.table_name = "sites"
  validates :name, presence: true

  #attr_accessor :name, :url, :tags



end