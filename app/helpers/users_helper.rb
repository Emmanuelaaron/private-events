module UsersHelper
  def logged_in_user_log?
    if signed_in?
      link_to 'Log out', log_out_path, class: 'nav-link nav-item',
                                       method: :delete, data: {
                                         confirmation: 'Are you sure?'
                                       }
    else
      link_to 'Sign Up', new_user_path, class: 'nav-link nav-item'
    end
  end

  def logged_in_user_all_events?
    if signed_in?
      link_to 'All Events', events_path, class: 'nav-link nav-item'
    else
      link_to 'Login', sessions_new_path, class: 'nav-link nav-item'
    end
  end

  def logged_in_user_create_event?
    if signed_in?
      link_to 'Create Event', new_event_path,
              class: 'nav-link nav-item'
    end
  end

  def logged_in_user_avatar?
    image_tag avatar_url(current_user) if signed_in?
  end
end
