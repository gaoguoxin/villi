require 'digest/sha1'
class WechartsController < ApplicationController
	def wechart_api
    	if request.get?
    		Rails.logger.info '=========================='
    		Rails.logger.info 'wechart_api get 请求。。。。。。'
    		Rails.logger.info '=========================='
    	else
    		Rails.logger.info '=========================='
    		Rails.logger.info 'wechart_api post 请求。。。。。。'
    		Rails.logger.info '=========================='
    		# do other things 
    	end
    	result = verify
    	render :text => params[:echostr] and return if result
    	render :text => 'false'
	end

    def verify
    	token     =  Wechart.token
    	tmp_arr   =  []
    	tmp_arr   << token
    	tmp_arr   << params[:timestamp]
    	tmp_arr   << params[:nonce]
    	tmp_arr.sort!
    	tmp_arr.join
    	str       =  Digest::SHA1.hexdigest(tmp_arr.join)
    	return true if str == params[:signature]
    	return false 	
    end




  	def generate_signure
  		@appid        = Wechart.appid
  		@noncestr     = newpass
  		@jsapi_ticket = Wechart.jsapi_ticket
  		@timestamp    = Time.now.to_i
  		@url          = request.url
  		string1       = "jsapi_ticket=#{@jsapi_ticket}&noncestr=#{@noncestr}&timestamp=#{@timestamp}&url=#{@url}"
      	@signure      =  Digest::SHA1.hexdigest(string1)
  	end

    def newpass
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      newpass = ""
      1.upto(16) { |i| newpass << chars[rand(chars.size-1)] }
      return newpass
    end

end