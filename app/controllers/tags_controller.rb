class TagsController < ApplicationController


  def create
      @resume = Resume.find(params[:resume_id])
      @tag = Tag.new(tag_params)
      @tag.resume = @resume
    if @tag.save
      redirect_to :back, notice: "created!"
    else
      render :back, notice: "error"
    end
  end

  def destroy
    @resume = Resume.find(params[:resume_id])
    @tag = Tag.find(params[:id])
    if @tag.destroy
      redirect_to edit_resume_path(@resume), alert: "已删除！"
    end
  end
  private
  def tag_params
    params.require(:tag).permit(:re_tag)
  end
end
