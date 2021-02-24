class Post < ApplicationRecord
    validates :title, presence: {message: 'must be provided'},uniqueness: true
    validates :description , presence: true, length:{minimum: 50}
end
