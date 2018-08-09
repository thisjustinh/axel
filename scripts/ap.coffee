module.exports = (robot) ->
	
	robot.hear /fuck/i, (res) ->
		res.send "That's a no-no word!"
