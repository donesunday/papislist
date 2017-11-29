class Api < ApplicationRecord
  belongs_to :country
  validates_presence_of :name, :link
end
