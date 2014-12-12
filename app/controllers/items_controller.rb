class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /items
  # GET /items.json
  def index
    #@items = Item.all
    @items = Item.where(:user_id => current_user.id)
    @items1 = Item.all
  end

  def index_user

  end

  def rentnow
   # @itemrent = Item.find(params[:item])
   #
   # @item_request = ItemRequest.new
   # @item_request.item_id = params[:item]
   # @item_request.user_id = @itemrent.user.id
   # @item_request.save
    session[:current_item_id] = params[:item]

    redirect_to(controller: "item_requests", action:"new")
  end

  def new_request

  end
  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @categories = Category.all
     @item = Item.new(item_params)
   @item.user_id= current_user.id
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    cu = User.find(current_user.id)
    @nu = User.near(cu.address, 100)
    @item = Item.where('user_id IN (?) AND user_id != ?',  @nu.each do |t| t.id end, current_user.id)
=begin
    @hash = Gmaps4rails.build_markers(User.where('id IN (?)', @item.each do |t| t.user_id end)) do |user, marker|
                                        marker.lat user.latitude
                                        marker.lng user.longitude
                                      end
=end
    if params[:search].present?
      @item = Item.where('name like ? AND user_id IN (?) AND user_id != ?', "%#{params[:search]}%", @nu.each do |t| t.id end, current_user.id)
      #@item = Item.all(:joins => :users, :select => "items.*, users.address as address, users.latitude as latitude, users.longitude as longitude", :group => "users.id")
      #all_items = @item

    else
      @item = Item.where('user_id IN (?) AND user_id != ?',  @nu.each do |t| t.id end, current_user.id)
      #@item = Item.joins(:user)
      #all_items = @item
    end


    #@tomark = User.where('id IN (?)', @nu.each do |t| t.id end)
    @hash = Gmaps4rails.build_markers(@item) do |i, marker|
      marker.lat i.user.latitude
      marker.lng i.user.longitude
      marker.infowindow i.description
    end
    @hash += Gmaps4rails.build_markers(User.find(current_user.id)) do |i, marker|
      marker.lat i.latitude
      marker.lng i.longitude
      #marker.infowindow(i.first_name+" "+i.last_name+" current address")
      marker.picture([i.avatar_url.to_s, :size =>'32x32'])
    end
=begin
    @tomark = User.where('id IN (?)', @nu.each do |t| t.id end)
    @hash = Gmaps4rails.build_markers(@tomark) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
      end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :image, :price, :keywords, :category_id, :user_id)
    end
end
