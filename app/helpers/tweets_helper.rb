module TweetsHelper

  def tweet_link tweet
    link = "<a href='tweets/#{tweet.id}'>".html_safe
    link += tweet.id.to_s
    link += '</a>'.html_safe
    link
  end

  def tweet_link_to_tag_page tag_name
    link = "<a href='tweets/tags/#{tag_name}'>".html_safe
    link += tag_name
    link += '</a>'.html_safe
    link
  end

end
