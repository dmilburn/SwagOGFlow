module ApplicationHelper
  def created_ago(object)
    seconds_ago = Time.now - object.created_at
    if seconds_ago > 86400
      (seconds_ago / 86400).to_i.to_s + " days ago"
    else
      (seconds_ago / 3600).to_i.to_s + " hours ago"
    end
  end
  def human_friendly_date(object)
      array = created_ago(object).split(" ")
      array[1] = array[1].singularize
      array.join(" ")
    else
      created_ago(object)
    end
  end
end
