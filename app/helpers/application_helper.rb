module ApplicationHelper
  def created_ago(creation)
    seconds_ago = Time.now - creation.created_at
    if seconds_ago > 86400
      (seconds_ago / 86400).to_i.to_s + " days ago"
    else
      (seconds_ago / 3600).to_i.to_s + " hours ago"
    end
  end
  def human_friendly_date(creation)
    if created_ago(creation)[0] == "1"
      array = created_ago(creation).split(" ")
      array[1] = array[1].singularize
      array.join(" ")
    else
      created_ago(creation)
    end
  end
end
