class Request < ApplicationRecord
    belongs_to :user

    validates :suit_no,presence: true
    validates :name,presence: true
    validates :request_type, presence: {message: 'should be provided'}
    validates :contact_phone,presence: true
    validates :email, presence: {message: 'must be provided'},uniqueness: true
    validates :additional_notes , presence: true, length:{minimum: 20}
end
