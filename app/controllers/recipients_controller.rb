class RecipientsController < ApplicationController
  before_filter :get_destination
  before_filter :authenticate, :only => [:index]
  
  def index
  end
  
  def create
    @recipient   = Recipient.new(params[:recipient].merge(:destination => @destination))
    @recipient.save
  end
  
  def update
    @recipient = Recipient.find(params[:id])
    if params[:recipient][:sent_at] == "1"
      @recipient.sent_at = Time.now
    else
      @recipient.sent_at = nil
    end
    @recipient.save!
    render :js => "alert('submitted');"
  end
  
  private
  def get_destination
    @destination = Destination.find_by_url_name(params[:destination_id])
  end
end
