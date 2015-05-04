class TagsController < ApplicationController

  def index
    @tags = Tag.order(:name)
    @tags = @tags.select{|tag| tag.questions.length > 0}
  end

  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.questions
  end

end