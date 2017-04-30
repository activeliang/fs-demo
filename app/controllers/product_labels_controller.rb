class ProductLabelsController < ApplicationController

  def new
    @cp_product = CpProduct.find(params[:cp_product_id])
    @product_label = ProductLabel.new
  end

  def create
    @cp_product = CpProduct.find(params[:cp_product_id])
    @product_label = ProductLabel.new(product_label_params)
    @product_label.cp_product_id = @cp_product.id
    if @product_label.save
      redirect_to :back, notice: "created!!!"
    else
      render :new
    end
  end

  def destroy
    @cp_product = CpProduct.find(params[:cp_product_id])
    @product_label = ProductLabel.find(params[:id])
    if @product_label.destroy
      redirect_to :back, alert: "Deleted!"
    end
  end

  private
  def product_label_params
    params.require(:product_label).permit(:label_item)
  end
end
