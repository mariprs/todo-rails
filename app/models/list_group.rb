class ListGroup < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
