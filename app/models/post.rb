class Post < ApplicationRecord
    validates :title, presence: {message: 'must be provided'}
    validates :image_url , presence: true,uniqueness: true
    validates :description , presence: true, length:{minimum: 15}

    has_many :comments, dependent: :destroy
    belongs_to :user


    def self.filter_by_title(name)
        if name
            where(["title LIKE ?","%#{name}%"])
        else
            all
        end
    end 
     
end
