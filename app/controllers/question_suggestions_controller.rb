class QuestionSuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /question_suggestions
  # GET /question_suggestions.json
  def index
    @question_suggestions = QuestionSuggestion.all
  end

  # GET /question_suggestions/1
  # GET /question_suggestions/1.json
  def show
  end

  # GET /question_suggestions/new
  def new
    @question_suggestion = QuestionSuggestion.new
  end

  # GET /question_suggestions/1/edit
  def edit
  end

  # POST /question_suggestions
  # POST /question_suggestions.json
  def create
    @question_suggestion = QuestionSuggestion.new(question_suggestion_params)

    respond_to do |format|
      if @question_suggestion.save
        format.html { redirect_to @question_suggestion, notice: 'Question suggestion was successfully created.' }
        format.json { render :show, status: :created, location: @question_suggestion }
      else
        format.html { render :new }
        format.json { render json: @question_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_suggestions/1
  # PATCH/PUT /question_suggestions/1.json
  def update
    respond_to do |format|
      if @question_suggestion.update(question_suggestion_params)
        format.html { redirect_to @question_suggestion, notice: 'Question suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_suggestion }
      else
        format.html { render :edit }
        format.json { render json: @question_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_suggestions/1
  # DELETE /question_suggestions/1.json
  def destroy
    @question_suggestion.destroy
    respond_to do |format|
      format.html { redirect_to question_suggestions_url, notice: 'Question suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_suggestion
      @question_suggestion = QuestionSuggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_suggestion_params
      params.require(:question_suggestion).permit(:suggestion_by, :text, :upvotes, :downvotes)
    end
end
