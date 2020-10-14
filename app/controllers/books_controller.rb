class BooksController < ApplicationController
  before_action :authenticate_user!, except:[:top]
  def top
  end

  def new
  end

  def create
  end

  def index
  end

  def show
  end

end
