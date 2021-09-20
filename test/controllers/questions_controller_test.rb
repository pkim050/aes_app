require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get new" do
    get new_question_url
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { answer_1: @question.answer_1, answer_2: @question.answer_2, answer_3: @question.answer_3, answer_4: @question.answer_4, answer_5: @question.answer_5, answer_6: @question.answer_6, answer_7: @question.answer_7, answers: @question.answers, comments: @question.comments, question_text: @question.question_text } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_url(@question)
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { answer_1: @question.answer_1, answer_2: @question.answer_2, answer_3: @question.answer_3, answer_4: @question.answer_4, answer_5: @question.answer_5, answer_6: @question.answer_6, answer_7: @question.answer_7, answers: @question.answers, comments: @question.comments, question_text: @question.question_text } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to questions_url
  end
end
