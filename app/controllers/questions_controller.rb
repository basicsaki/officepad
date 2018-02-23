class QuestionsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit, :update, :destroy,:create]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @category = Category.find(params[:category_id])
    @questions = @category.questions.page(params[:page]).order('updated_at DESC')
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @category = Category.find(params[:category_id])
    @answers = @question.answers.page(params[:page]).order('updated_at DESC')
    @recommended_questions = @category.questions.first(5)
  end

  # GET /questions/new
  def new
    @category = Category.find(params[:category_id])
    @question = @category.questions.build
  end

  # GET /questions/1/edit
  def edit
    @category = Category.find(params[:category_id])
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @category = Category.find(params[:category_id])
    @question = @category.questions.build(question_params) #Question.new()
    @question.owner = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to category_question_path(:category_id=>@category.id,:question_id=>@question.id,id: @question.id), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    if params[:q].nil?
      @questions = []
    else
      @questions = Question.search params[:q]
    end
    @categories = Category.all
    @search_string = params[:q]
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @category = Category.find(params[:category_id])
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to category_question_path(:category_id=>@category.id,:question_id=>@question.id), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    @category = Category.find(params[:category_id])

    respond_to do |format|
      format.html { redirect_to category_questions_path(:category_id=>@category.id), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:name, :description, :asked_by, :upvotes, :downvotes)
    end
end
