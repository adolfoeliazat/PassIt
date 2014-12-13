class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @myitems = Item.where(:user_id => current_user.id)
    user = current_user.id
    owneditems=Item.where(user_id: user).select('id')
    @myitem_requests=ItemRequest.where(:item_id =>owneditems.map(&:id),:status=>"Requested")
  end
end
