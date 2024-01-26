require "http/client"
require "random"
require "json"

module HentaiImages
	CLIENT.on_message_create do |payload|
		if payload.content.starts_with? "!hsearch "
			begin 
				response = HTTP::Client.get("https://nsfw-api-p302.onrender.com/h/image/search?q=#{payload.content[9..-1]}")
				image = JSON.parse(response.body)
				randomImage = Random.rand(0..image.size)
   	 		CLIENT.create_message(payload.channel_id, "", Discord::Embed.new(title: "#{payload.content[9..-1]} images", image: Discord::EmbedImage.new(image[randomImage].as_s), colour: 0xA4A6FF, author: Discord::EmbedAuthor.new("github.com/Swag666baby")))
   		rescue
   			CLIENT.create_message(payload.channel_id, "", Discord::Embed.new(title: "❌Error not found!", colour: 0xFF0000, author: Discord::EmbedAuthor.new("github.com/Swag666baby")))
   		end
		end
	end
end