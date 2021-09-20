class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_select_collections, only: [:edit, :update, :new, :create]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
    #@import = Question.new.import

    respond_to do |format|
      format.html
      format.csv { send_data @questions.to_csv, filename: "questions-#{Date.today}" }
    end
  end

  def import
    @import = Question::Import.new question_import_params
    if @import.save
      redirect_to questions_path, notice: "Imported #{@import.imported_count} questions."
    else
      @questions = Question.all
      flash[:alert] = "There were #{@import.errors.count} errors with your CSV file."
      render action: :index
    end
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    @user = User.find(session[:user_id])
    if @user.tester
      check = params.require(:question)
      counter = 0
      check.each do |key, value|
        if value == "1"
          value = true
        else
          value = false
        end
        key = key.split("tester_")[-1]
        counter += 1 if @question[key] != value
      end
      if counter > 0
        respond_to do |format|
          format.html { redirect_to @question, notice: "You got this question wrong, please try again." }
          format.json { render :show, status: :ok, location: @question }
        end
      else
        respond_to do |format|
          format.html { redirect_to @question, notice: "Correct!" }
          format.json { render :show, status: :ok, location: @question }
        end
      end
    else
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to @question, notice: "Question was successfully updated." }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_select_collections
      @users = User.where(sme: true).or(User.where(editor: true))
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question_text, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :answer_6, :answer_7, :answers, :comments, :answer_1_text, :answer_2_text, :answer_3_text, :answer_4_text, :answer_5_text, :answer_6_text, :answer_7_text, :user_id, :assigned)
    end

    def question_import_params
      params.require(:question_import).permit(:file)
    end
end
