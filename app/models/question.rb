class Question < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :answer_1_text, :answer_2_text, :question_text, presence: true
    validate :must_have_one_correct_answer

    def must_have_one_correct_answer
        if answer_1 == true || answer_2 == true || answer_3 == true || answer_4 == true || answer_5 == true || answer_6 == true
        else
            errors.add(:please_check_the_correct_answers_and_input_at_least_2_answers, "should have at least one correct answer. Please check one of the answers.")
        end
    end

    def self.to_csv
        headers = ["Question ID", "Question", "Answer 1", "Answer 2", "Answer 3", "Answer 4", "Answer 5", "Answer 6", "Answer 7", "Correct Answer(s)", "Created By", "Currently Assigned To", "Status", "Number of Comments"]
        CSV.generate(headers: true) do |csv|
            csv << headers
                Question.all.each do |question|
                answers = []
                answers << question.answer_1_text if question.answer_1
                answers << question.answer_2_text if question.answer_2
                answers << question.answer_3_text if question.answer_3
                answers << question.answer_4_text if question.answer_4
                answers << question.answer_5_text if question.answer_5
                answers << question.answer_6_text if question.answer_6
                answers << question.answer_7_text if question.answer_7
                csv << [question.id, question.question_text, question.answer_1_text, question.answer_2_text, question.answer_3_text, question.answer_4_text, question.answer_5_text, question.answer_6_text, question.answer_7_text, answers, User.find(question.user_id).username, User.find_by_id(question.assigned)&.username, question.ready ? "Ready" : "Not Ready", question.comments.count]
            end
        end
    end
end