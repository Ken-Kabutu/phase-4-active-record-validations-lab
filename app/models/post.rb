class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates :clickbait_title


    private

    def clickbait_title
        unless title.include?("Won't Believe") || title&.include?("Secret") || title&.include?("Top") || title&.include?("Guess")
            errors.add(:title, "must be clickbait-y")
        end
    end
end
