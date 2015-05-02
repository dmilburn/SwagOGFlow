class QuestionsController < ApplicationController

  before_action :gate_keeper, only: [:new]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def popular
    @questions = Question.all
    @questions = @questions.sort{|a, b| b.count_votes <=> a.count_votes}
  end

  def new
    @question = Question.new
  end

  def create
    question = current_user.questions.build(question_params)
    if question.save
      tags_array = params[:question][:tag_list].split(",")
      tags_array.each do |tag_name|
        question.tags.find_or_create_by(name: tag_name)
      end
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
  end

  def edit
    @question = Question.find(params[:id])
    @tags = @question.tags
  end

  def update
    question = Question.find(params[:id])
    if question.update_attributes(question_params)
      new_tags = params[:question][:tag_list].split(" ")
      old_tags = question.tag_list.split(" ")
      tags_to_remove = old_tags - new_tags
      tags_to_create = new_tags - old_tags
      tags_to_create.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        tag.question_tags.create(question_id: question.id)
      end
      tags_to_remove.each do |tag_name|
        tag = Tag.find_by(name: tag_name)
        question.question_tags.find_by(tag_id: tag.id).destroy
      end
      redirect_to question_path(question)
    else
      redirect_to edit_question_path(question)
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end

end