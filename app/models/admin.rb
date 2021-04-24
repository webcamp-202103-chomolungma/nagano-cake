class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable,:validatable
end
