module ApplicationHelper

  def nav_tab_active(short_name, name = nil)
    #if name =
    if short_name.blank?
      'active'
    else
      'active' if short_name == name
    end
  end
end
