# frozen_string_literal: true

module AdminHelper
  def admin_page_header(*options, &block)
    locals = options.extract_options!
    defaults = {
      title: nil,
      search_input_name: nil,
      search_placeholder: nil,
      search_url: nil,
      link_path: nil,
      link_name: nil,
      custom_content: block
    }

    render partial: 'shared/page_header', locals: defaults.merge(locals)
  end

  def users_table(*options, &block)
    locals = options.extract_options!
    defaults = {
      users: nil,
      user_class: nil,
    }

    render partial: 'shared/users_index', locals: defaults.merge(locals)
  end

  def activate_path(user, user_class)
    check_user_class(user_class) ? activate_admin_admin_path(user) : activate_cashier_cashier_path(user)
  end

  def destroy_path(user, user_class)
    check_user_class(user_class) ? admin_path(user) : cashier_path(user)
  end

  def reset_password_path(user, user_class)
    check_user_class(user_class) ? admin_reset_password_path(user) : cashier_reset_password_path(user)
  end

  def check_user_class(user_class)
    user_class == "Admin"
  end
end
