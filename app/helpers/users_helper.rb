module UsersHelper

    def render_header_buttons(user)
        case user.access
        when "admin"
            link_to("Pending Courses", pending_courses_path, class: "btn btn-primary ms-1") +
            link_to("Employees", admin_users_path, class: "btn btn-primary ms-1") +
            link_to("Facilitations", user_courses_path(user), class:"btn btn-primary ms-1")
        when "facilitator"
            if admin?
                link_to("Review this Employee", new_user_review_path(user), class: "btn btn-primary ms-1") +
                link_to("Professional Reviews", user_reviews_path(user), class: "btn btn-primary ms-1") +
                link_to("Facilitations", user_courses_path(user), class:"btn btn-primary ms-1")
            else
                link_to("Professional Reviews", user_reviews_path(user), class: "btn btn-primary ms-1") +
                link_to("Facilitations", user_courses_path(user), class:"btn btn-primary ms-1")
            end
        else
        end
    end
end
