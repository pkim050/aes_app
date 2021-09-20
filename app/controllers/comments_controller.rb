class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.create(comment_params)
    if @comment.user.etd
      @question.comments.sort_by{|c| c.created_at}.reverse.each do |comment|
        if comment.user_id != @comment.user_id
          @question.assigned = comment.user_id
          @question.save
        end
      end
    else
      @question.assigned = @question.user_id
      @question.save
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @question, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    parameters = params[params.keys.third]
    if parameters.values.count > 1
      @comment = Comment.where(question_id: parameters[:question_id]).where(id: parameters[:comment_id]).take
      @comment.completed = true
      @comment.save
      redirect_to @comment.question
    else
      @question = Question.find(parameters[:question_id])
      @question.ready = true
      @question.save
      redirect_to @question
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:comment_text, :question_id, :user_id)
    end
end
