module ApplicationHelper
    def active_class(link_path)
        current_page?(link_path) ? "active" : ""
    end

    def chk_class(link_path)
        current_page?(controller:'courses') &&
        (current_page?(action:'index') ||
        current_page?(action:'edit')) ? "active" : ""
    end
end
