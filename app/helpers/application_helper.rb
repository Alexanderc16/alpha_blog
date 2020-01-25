module ApplicationHelper

    def bootstrap_class_for(flash_type)
        case flash_type
        when "success"
            "alert-success"
        when "error"
            "alert-danger"
        when "alert"
            "alert-warning"
        when "notice"
            "alert-info"
        else
            flash_type.to_s
        end
    end
    
    def gravatar_for(user, options = {size: 80})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class:"rounded-circle")
    end
end
