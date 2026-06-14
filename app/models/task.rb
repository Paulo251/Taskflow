class Task < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3 }

    belongs_to :user

    scope :pending, -> { where(done: false) }
    scope :completed, -> { where(done: true) }
    scope :recent, -> { order(created_at: :desc) }
end
