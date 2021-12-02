class Paper < ApplicationRecord

    has_and_belongs_to_many :authors
    scope :published_in, ->(year) {where("year == ?", year)}
    validates :title, :venue, :year, presence: true
    validates :year, numericality: true

end
