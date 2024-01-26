require "http/client"
require "random"
require "json"

commands = JSON.parse(File.read("./database/commands.json"))

module RealImages
	CLIENT.on_message_create do |payload|
		commands.as_a.each do |command|
			if payload.content == command
				response = HTTP::Client.get("https://nsfw-api-p302.onrender.com/r/image/#{command.as_s()[1..-1]}")
				image = JSON.parse(response.body)
				randomImage = Random.rand(0..image.size)
				puts randomImage
    			CLIENT.create_message(payload.channel_id, "", Discord::Embed.new(title: "#{command.as_s()[1..-1]} images", image: Discord::EmbedImage.new(image[randomImage].as_s), colour: 0xA4A6FF, author: Discord::EmbedAuthor.new("github.com/Swag666baby")))
    		end
		end
	end
end