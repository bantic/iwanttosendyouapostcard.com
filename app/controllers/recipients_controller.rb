class RecipientsController < ApplicationController
  before_filter :get_destination
  
  def index
  end
  
  def create
    @recipient   = Recipient.new(params[:recipient].merge(:destination => @destination))
    @recipient.save
  end
  
  private
  def get_destination
    @destination = Destination.find_by_url_name(params[:destination_id])
  end
end
