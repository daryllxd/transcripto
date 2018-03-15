# frozen_string_literal: true
module NavigationHelper
  def active_nav_class(path)
    if current_page?(path)
      'nav-item active'
    else
      'nav-item'
    end
  end
end
