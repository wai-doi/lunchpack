module ApplicationHelper
  def page_active(path)
    request.path == path ? 'active': ''
  end

  def project_list(member)
    if member.projects.present?
      member.projects.pluck(:name).join(',')
    else
      '-'
    end
  end

  def current_quarter_active(quarter)
    quarter.cover_today? ? 'active' : ''
  end

  def form_active(form_value)
    form_value.present? ? 'active' : ''
  end
end
