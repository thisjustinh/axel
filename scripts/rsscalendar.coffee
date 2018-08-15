# Description:
#   TESD RSS Reader
#
#   Parses RSS feed of the Tredyffrin/Easttown School District (TESD), with the option of tailoring to a specific school
#
# Dependencies:
#   none
#
# Configuration:
#   none
#
# Commands:
#
#
# Author:
#   xinging-birds
module.exports = (robot) ->

  robot.respond /display TESD events/i, (res) ->
    parseRSS res

parseRSS = (res) ->
  res
    .http('https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.tesd.net%2Fsite%2FRSS.aspx%3FDomainID%3D1%26ModuleInstanceID%3D1923%26PageID%3D2')
    .header('Accept', 'application/json')
    .get() (err, response, body) ->

      try
        feed = JSON.parse body
        res.send "#{feed.items[i].title}" for i in [0...feed.items.length]
      catch
        res.send 'Error parsing JSON.'
        return
