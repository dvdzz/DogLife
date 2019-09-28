class Dog < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :name, length: { minimum: 3, too_short: " - %{count} characters is the minimum allowed" }
    validates :caption, presence: true
end
