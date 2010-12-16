class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  before_filter :test_for_mobile_browser
  
  MOBILE_USER_AGENTS =  'palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|' +
                            'audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|' +
                            'x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|' +
                            'pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|up\\.b|' +
                            'webos|amoi|novarra|cdm|alcatel|pocket|ipad|iphone|mobileexplorer|' +
                            'mobile'

  private
  
  def test_for_mobile_browser
    if request.user_agent.to_s.downcase =~ Regexp.new(MOBILE_USER_AGENTS)
      @is_mobile_browser = true
    else
      @is_mobile_browser = false
    end
  end
end
