module UsersHelper
	def load_image_from_robohash(user)
		
		image_url="https://robohash.org/#{user.email}"

		return image_tag(image_url,alt:user.name,class:"img-thumbnail")
    end
end
