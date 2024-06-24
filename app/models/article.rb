class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true,length: { in: 3..1000 }
    validates :description, presence: true,length: {minimum: 10}
end
