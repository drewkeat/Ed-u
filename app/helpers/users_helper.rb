module UsersHelper

    def render_header_buttons(user)
        case user.access
        when "admin"
            link_to("Employees", admin_users_path, class: "btn btn-primary ms-1") +
            link_to("Facilitation Reviews", user_reviews_path(user), class: "btn btn-primary ms-1") +
            link_to("Facilitations", user_courses_path(user), class:"btn btn-primary ms-1")
        when "facilitator"
            link_to("Facilitation Reviews", user_reviews_path(user), class: "btn btn-primary ms-1") +
            link_to("Facilitations", user_courses_path(user), class:"btn btn-primary ms-1")
        else
        end
    end
end
