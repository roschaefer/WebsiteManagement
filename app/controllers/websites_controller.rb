class WebsitesController  < ApplicationController
before_filter :authenticate
layout false

#def current_page
  #website = Website.find_by_folder(params[:website_folder])
  #"#{website.folder}/#{super}"
#end



  def show
    logger.debug "Current page is: #{current_page}"
    #custom_authentication current_page
    send_file "app/views/#{current_page}", :disposition => 'inline'
  end

  #def access_allowed?(accessed_path)
    #current_client.websites.any? {|aSite| accessed_path.start_with?("#{HighVoltage.content_path}#{aSite.folder}")}
  #end


  #def custom_authentication(accessed_path)
    #logger.debug "accessed #{accessed_path}"
    #unless access_allowed?(accessed_path)
      #raise CanCan::AccessDenied.new("Not authorized!")
    #end
  #end

end
