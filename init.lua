opening_hours = {
    weekday = {14, 21},
    weekend = {8, 21},
}

minetest.register_on_joinplayer(function(player)
    if minetest.check_player_privs(player:get_player_name(), {server = true}) then return end
    local t = os.date("*t")
    local times = opeing_hours[(t.wday < 6) and "weekday" or "weekend"]
    if t.hour < times[1] or t.hour >= times[2] then
        minetest.kick_player(player:get_player_name(), "Der Server hat im Moment nicht geöffnet. Öffungszeiten: Mo. - Fr. 14-21 Uhr und Sa. / So. 8-21 Uhr.")
    end
end)
