class ItemRequestsController < ApplicationController
 before_action :set_item_request, only: [:show, :edit, :update, :destroy]


 def index
    @item_requests = ItemRequest.all
 end

 def requestindex
   @selectitems=["All","Requested","Accepted","Rejected"]

   if params[:search]
     @item_requests = ItemRequest.where('user_id=? AND status=?', current_user.id, params[:search])
   else
     @item_requests = ItemRequest.where(user_id: current_user.id)
   end
   if params[:search]=='All'
     @item_requests = ItemRequest.where(user_id: current_user.id)
   end
    # To find the items which the user has requested(borrow)
    #user = current_user.id
    #@item_requests = ItemRequest.where(user_id: user)
    #@items2=Item.where(id: @item_requestborrower)
 end

 def pendingrequestindex
   # To find the items which the user has requested(borrow)
   user = current_user.id
   #@item_requests = ItemRequest.where(user_id: user)
   @item_requests = ItemRequest.where('user_id=? AND status=?', user, "Requested")
   #@items2=Item.where(id: @item_requestborrower)
 end


 def offerindex
   user = current_user.id
   @selectitems=["All","Requested","Accepted","Rejected"]

   if params[:search]
     #@item_requests = ItemRequest.where('user_id=? AND status=?', current_user.id, params[:search])
     owneditems=Item.where(user_id: user).select('id')
     @item_requests=ItemRequest.where(:item_id =>owneditems.map(&:id),:status=>params[:search])
   else
     user = current_user.id
     owneditems=Item.where(user_id: user).select('id')
     @item_requests=ItemRequest.where(:item_id=>owneditems.map(&:id))
   end
   if params[:search]=='All'
     user = current_user.id
     owneditems=Item.where(user_id: user).select('id')
     @item_requests=ItemRequest.where(:item_id=>owneditems.map(&:id))
   end
    #user = current_user.id
    #owneditems=Item.where(user_id: user).select('id')
    #@item_requests=ItemRequest.where(:item_id=>owneditems.map(&:id))

 end

 def pendingofferindex
    user = current_user.id
    owneditems=Item.where(user_id: user).select('id')
    @item_requests=ItemRequest.where(:item_id =>owneditems.map(&:id),:status=>"Requested")
 end

 def acceptofferindex
   user = current_user.id
   owneditems=Item.where(user_id: user).select('id')
   @item_requests=ItemRequest.where(:item_id =>owneditems.map(&:id),:status=>"Accepted")
 end

 def rejectofferindex
   user = current_user.id
   owneditems=Item.where(user_id: user).select('id')
   @item_requests=ItemRequest.where(:item_id =>owneditems.map(&:id),:status=>"Rejected")
 end

 def show
    #respond_with(@item_request)
 end

 def new
    @currentitem = session[:current_item_id]
    @itemname = Item.find(@currentitem).name
    @itemimage =Item.find(@currentitem).image
    @itemprice = Item.find(@currentitem).price
    @item_request = ItemRequest.new
    @item_request.toDate = Date.today
    @item_request.fromDate = Date.today
    @item_request.item_id = @currentitem
    @item_request.user_id = current_user.id
    @item_request.price = (@item_request.toDate - @item_request.fromDate).to_i * @itemprice
 end

 def acceptoffer
    item_request = ItemRequest.find(params[:id])
    item_request.status = "Accepted"
    item_request.save
    redirect_to(userofferindex_path, notice: 'Item Offer Accepted.' )
 end

 def rejectoffer
    item_request = ItemRequest.find(params[:id])
    item_request.status = "Rejected"
    item_request.save
    #render :text => "#{@item_request.status}".html_safe
    redirect_to(userofferindex_path, notice: 'Item Offer Rejected.' )
 end

 def edit
 end

 def create
    @item_request = ItemRequest.new(item_request_params)
    @item_request.status = "Requested"
    item = Item. find(@item_request.item_id)
    @item_request.price = (@item_request.toDate - @item_request.fromDate).to_i * item.price
    item.availability="Requested"
    item.save

    respond_to do |format|
      if @item_request.save
        format.html { redirect_to userrequestindex_path, notice: 'Please check your dashboard to see if
                        the offer was accepted by owner.' }
        #format.json { render :show, status: :created, location: @item }
      else
        format.html { redirect_to items_search_path, notice: 'Sorry. Item Request Failed. Please try again' }
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
    redirect_to(userrequestindex_path, notice: 'Item Request Deleted.' )
 end

  private
    def set_item_request
      @item_request = ItemRequest.find(params[:id])
    end

    def item_request_params
      params.require(:item_request).permit(:item_id, :user_id, :fromDate, :toDate, :description, :price)
    end
end
