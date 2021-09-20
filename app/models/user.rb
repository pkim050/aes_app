class User < ApplicationRecord
    has_many :questions
    has_many :comments, through: :questions
    has_secure_password

    validate :must_have_one_item
    enum options: { tester: 0, editor: 1, sme: 2, etd: 3 }

    def must_have_one_item
        counter = 0
        counter += 1 if self.tester
        counter += 1 if self.editor
        counter += 1 if self.sme
        counter += 1 if self.etd
        if counter > 1
            errors.add(:roles, "can only have one per user.")
        end
    end
end
