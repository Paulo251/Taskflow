class User < ApplicationRecord
    validates :name, presence: true, 
                    length: { minimum: 3 }

    validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

    has_many :tasks
end

