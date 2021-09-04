module ApplicationHelper

    def admin?
        !!current_user.access == "admin"
    end

    def facilitator?
        !!current_user.access == "facilitator"
    end

    def learner?
        !!current_user.access == "learner"
    end

end
