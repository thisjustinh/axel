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

  robot.respond /display (.*) events/i, (res) ->
    parseRSS res, res.match[1]

parseRSS = (res, scope) ->
  if scope is 'Conestoga' or scope is 'Stoga' or scope is '\'stoga' or scope is 'stoga' or scope is '\'Stoga'
    url = 'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.tesd.net%2Fsite%2FRSS.aspx%3FDomainID%3D78%26ModuleInstanceID%3D1925%26PageID%3D352'
  else if scope is 'TESD' or scope is 'tesd' or scope is 'Tredyffrin/Easttown School District' or scope is 'the school district' or scope is 'the school district\'s'
    url = 'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.tesd.net%2Fsite%2FRSS.aspx%3FDomainID%3D1%26ModuleInstanceID%3D1923%26PageID%3D2'
  else
    res.send "Invalid input. If that was supposed to work, go yell at Justin."
    return

  res
    .http(url)
    .header('Accept', 'application/json')
    .get() (err, response, body) ->

      try
        feed = JSON.parse body
        res.send "#{feed.items[i].title}" for i in [0...feed.items.length]
      catch
        res.send 'Error parsing JSON.'
        return
