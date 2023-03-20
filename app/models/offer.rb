class Offer < ApplicationRecord
    has_many :user_offers
    has_many :users, through: :user_offers

    def eligible?(user)
        (target_gender == user.gender || target_gender == 'any') &&
        (user.age >= target_age_min && user.age <= target_age_max)
    end
end
