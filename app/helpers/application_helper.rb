module ApplicationHelper
	def user_email(post)
		post.user.present? ? post.user.email : "an anonymous user"
  end

  def user_roles(user)
    user.roles.map(&:name).join(', ').titleize
  end

  def link_to_provider(user)
    provider = user.identities.map(&:provider).join(', ')
    provider = case provider
    when 'facebook' then link_to( 'Go to Facebook', 'http://www.facebook.com' )
    when 'twitter' then link_to( 'Go to Twitter', 'http://twitter.com' )
		#when 'foursquare' then link_to( 'Go to Foursquare', 'http://foursquare.com' )
		#when 'google'    then link_to( 'Go to Google', 'http://google.com')
    end

  end
end
