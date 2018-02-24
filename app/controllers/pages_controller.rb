class PagesController < ApplicationController
  
  def home
  	@notes = NoticeBoard.all.order("updated_at desc").first(4)
  end

  def about
  end

  def contact
  end

end
