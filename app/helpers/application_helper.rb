module ApplicationHelper
  def sortable(sort_button, sort_button_name = nil)
    sort_button_name ||= sort_button.titleize

    if sort_button.titleize == sort_button_name
      css_class = "current #{sort_direction}"
    else
      css_class = nil
    end

    # css_class = (sort_button == sort_button_name) ? "current #{sort_direction}" : nil
    if sort_button == params[:sort] && params[:direction]=="asc"
      direction = "desc"
    else
      direction = "asc"
    end
    # direction = (sort_button == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"

    link_to sort_button_name, {:sort => sort_button, :direction => direction}, {:class => css_class}
  end
end
