class QuizzesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_question, only: [:show, :edit, :update, :destroy]
    require 'mail'
    
    # GET /questions
    # GET /questions.json
    def index
      @questions = Question.all
      @answers = Answer.all
    end
  
    # GET /questions/1
    # GET /questions/1.json
    def show
    end
  
    # GET /questions/new
    def new
      @answers = Answer.new
      @answers.question.build
      @answers.user.build
      
    end
  
    # GET /questions/1/edit
    def edit
    end
  
    # POST /questions
    # POST /questions.json
    def create
      @answer = Answer.new(question_params)
      @answer.answer = answer_params
      if Answer.where("user_id = #{@answer.user_id} AND question_id = #{@answer.question_id}").empty?
          respond_to do |format|
          if @answer.save
            format.html { redirect_to @answer, notice: 'Question was successfully created.' }
            format.json { render :show, status: :created, location: @question }
          else
            format.html { render :new }
            format.json { render json: @answer.errors, status: :unprocessable_entity }
          end
        end
      else 
        update
      end
    end
    # PATCH/PUT /questions/1
    # PATCH/PUT /questions/1.json
    def update
      respond_to do |format|
        @answer = Answer.where("user_id = #{@answer.user_id} AND question_id = #{@answer.question_id}").first
        if @answer.update({"answer" => answer_params})
          format.html { redirect_to root_path, notice: 'Answer was successfully updated.' }
          format.json { render :show, status: :ok, location: @answer }
        else
          format.html { render :edit }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /questions/1
    # DELETE /questions/1.json
    def destroy
      @answer.destroy
      respond_to do |format|
        format.html { redirect_to answers_url, notice: 'answer was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_answer
        @answer = answer.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def question_params
        params.require(:answer_quiz).permit(:user_id, :question_id)
      end

      def answer_params
        params.require(:answer)
      end
  end
  