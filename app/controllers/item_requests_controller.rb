class ItemRequestsController < ApplicationController
 before_action :set_item_request, only: [:show, :edit, :update, :destroy]


  def index
    @item_requests = ItemRequest.all
    #respond_with(@item_requests)
  end

  def show
    #respond_with(@item_request)
  end

  def new
    @currentitem = session[:current_item_id]
    @itemname = Item.find(@currentitem).name
    @itemprice = Item.find(@currentitem).price
    @item_request = ItemRequest.new
    @item_request.toDate = Date.today
    @item_request.fromDate = Date.today
    @item_request.item_id = @currentitem
    @item_request.user_id = current_user.id
    @item_request.price = (@item_request.toDate - @item_request.fromDate).to_i * @itemprice
    #respond_with(@item_request)
  end

  def edit
  end

  def create
    @item_request = ItemRequest.new(item_request_params)
    item = Item. find(@item_request.item_id)
    @item_request.price = (@item_request.toDate - @item_request.fromDate).to_i * item.price
    item.availability="Requested"
    item.save

    respond_to do |format|
      if @item_request.save
        format.html { redirect_to items_search_path, notice: 'A message has been sent to the
                        owner. You will receive email when the owner responds.' }
        #format.json { render :show, status: :created, location: @item }
      else
        format.html { redirect_to items_search_path, notice: 'Item was not created.' }
        #format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
    #respond_with(@item_request)
    #render action: "display.html.erb"
    #redirect_to(controller: "items", action:"search")
  end

  def update
    @item_request.update(item_request_params)
    #respond_with(@item_request)
  end

  def destroy
    @item_request.destroy
    #respond_with(@item_request)
  end

  private
    def set_item_request
      @item_request = ItemRequest.find(params[:id])
    end

    def item_request_params
      params.require(:item_request).permit(:item_id, :user_id, :fromDate, :toDate, :description, :price)
    end
end
