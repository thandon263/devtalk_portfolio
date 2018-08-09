module CurrentUserConcern
    extend ActiveSupport::Concern
    # Implementing the null object pattern
    def current_user
        super || guest_user
    end

    def guest_user
        OpenStruct.new(
            name: "Guest User", 
            first_name: "Guest", 
            last_name: "User", 
            email: "guest@user.com"
        )
    end
end