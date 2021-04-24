class Product < ApplicationRecord
  attachment :image
  # belongs_to :genre, optional: true
  belongs_to :genre
end