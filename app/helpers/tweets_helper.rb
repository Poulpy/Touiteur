module TweetsHelper
  def tweet_link tweet
    link = "<a href='tweets/#{tweet.id}'>".html_safe
    link += tweet.id.to_s
    link += '</a>'.html_safe
    link
  end
end
