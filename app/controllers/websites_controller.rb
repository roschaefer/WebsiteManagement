class WebsitesController < HighVoltage::PagesController
before_filter :authenticate_user!
layout false

  def show
    custom_authentication current_page
    send_file "app/views/#{current_page}", :disposition => 'inline'
  end

  def custom_authentication(accessed_path)
    accessed_path.gsub!(/^#{HighVoltage.content_path}/,"")
    logger.debug "The accessed path is: #{accessed_path}"
    unless Website.find_all_containing(accessed_path).any? {|website| can? :read, website}
      raise CanCan::AccessDenied.new("Not authorized!")
    end
  end

end
