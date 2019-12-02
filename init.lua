minetest.register_node("big_wifi_chest:big_wifi_chest", {
	description = "Big Wifi Chest",
	tiles = {"wifi_top.png", "wifi_top.png", "wifi_side.png",
		"wifi_side.png", "wifi_side.png", "wifi_front.png"},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2,},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[16,13]"..
				default.gui_bg ..
				default.gui_bg_img ..
				default.gui_slots ..
				"list[current_player;big_wifi_chest:big_wifi_chest;0,0.3;16,8;]"..
				"list[current_player;main;4,8.85;8,1;]" ..
				"list[current_player;main;4,10.08;8,3;8]" ..
				"listring[current_player;big_wifi_chest:big_wifi_chest]" ..
				"listring[current_player;main]" ..
				default.get_hotbar_bg(0,8.85))

		meta:set_string("infotext", "Big Wifi Chest")
	end,
	on_metadata_inventory_move = function(pos, _, _, _, _, _, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in big wifi chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, _, _, _, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to big wifi chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, _, _, _, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from big wifi chest at "..minetest.pos_to_string(pos))
	end,
})

minetest.register_craft({
	output = 'big_wifi_chest:big_wifi_chest',
	recipe = {
		{'default:mese','default:mese','default:mese'},
		{'default:wood','default:steel_ingot','default:wood'},
		{'default:mese','default:mese','default:mese'}
	}
})

minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("big_wifi_chest:big_wifi_chest", 16*8)
end)
