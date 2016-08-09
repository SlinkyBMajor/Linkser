class Site < ActiveRecord::Base

  self.table_name = "sites"

  attr_accessor :name, :url, :tags

  @name = ''
  @url = ''
  @tags = Array.new
  @category = ''
  @times_visited = 0
  @descripition = ''

end