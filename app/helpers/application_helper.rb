module ApplicationHelper
  def has_errors(model, field)
    'error' if model.errors[field].any?
  end

  def errors(model, field)
    if model.errors[field].any?
      return content_tag :span, class: 'help-inline' do
        model.errors[field].join(', ')
      end
    end
  end
end
