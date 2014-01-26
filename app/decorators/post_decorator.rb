class PostDecorator < Draper::Decorator
  decorates :post
  delegate_all

  def friendly_title
    title.gsub(' ', '-').downcase
  end

  def truncated_body
    h.raw h.truncate(body, length: 200, omission: "...")
  end
  def friendly_date
  	date = created_at
  	return date.strftime("%d/%m/%Y : %H:%M") 
  end

  def tags_array
    return [1]
  end
end
