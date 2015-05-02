class QuestionsController < ApplicationController

  before_action :gate_keeper, only: [:new]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def popular
    @questions = Question.all
    sort_by_popularity(@questions)
  end

  def new
    @question = Question.new
  end

  def create
    question = current_user.questions.build(question_params)
    if question.save
      tags_array = params[:question][:string_of_tags].split(" ")
      question.create_tags(tags_array)
      flash[:notice] = "Your question has been posted!"
      redirect_to question_path(question)
    else
      flash[:notice] = "Sorry, your question didn't save. Please try again."
      redirect_to new_question_path
    end
  end

  def show
    @answer = Answer.new
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answers = sort_by_popularity(@answers)
    @answers = sort_by_selected(@answers)
    @responses = @question.responses
  end

  def edit
    @question = Question.find(params[:id])
    @tags = @question.tags
  end

  def update
    question = Question.find(params[:id])
    if question.update_attributes(question_params)
      new_tags = params[:question][:string_of_tags].split(" ")
      old_tags = question.string_of_tags.split(" ")
      tags_to_remove = old_tags - new_tags
      tags_to_create = new_tags - old_tags
      question.create_tags(tags_to_create)
      question.remove_tags(tags_to_remove)
      redirect_to question_path(question)
    else
      redirect_to edit_question_path(question)
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end
  def sort_by_selected(answers_array)
    answers_array = answers_array.partition{|answer| answer.selected }
    answers_array[0] + answers_array[1]
  end

end