class Api < ApplicationRecord
  belongs_to :country
  validates_presence_of :name, :link

  include PgSearch
  pg_search_scope :search_by_name_and_description, 
                  :against => [:name, :description],
                  :using => {
                    :tsearch => {
                      :prefix => true
                    }
                  }
end
