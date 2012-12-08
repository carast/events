module ApplicationHelper
  def has_errors(model, field)
    'error' if model.errors[field].any?
  end

  def field_errors(model, field)
    if model.errors[field].any?
      return content_tag :span, class: 'help-inline' do
        model.errors[field].join(', ')
      end
    end
  end

  def form_errors(model)
    if model.errors.any?
      content_tag :div, class: 'alert alert-error' do
        content = content_tag :strong, t(:invalid_form)
        content << content_tag(:span, t(:correct_errors))
      end
    end
  end
end
