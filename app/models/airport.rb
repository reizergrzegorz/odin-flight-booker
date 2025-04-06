class Airport < ApplicationRecord
    validates :code, uniqueness: true
end
