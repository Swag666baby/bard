require "discordcr"
require "./commands/nsfw/real/real_images.cr"
require "./commands/nsfw/hentai/image_search.cr"
require "./commands/others/commands.cr"

CLIENT = Discord::Client.new(token: "Bot <place your token here>", client_id: <place your client id here>_u64)
CLIENT.run
