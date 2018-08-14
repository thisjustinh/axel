cheerio = require 'cheerio'

module.exports = (robot) ->

  robot.respond /show me the latest patch about (.*)/i, (msg) ->
    category = msg.match[1].trim()
    scrape(msg, category, i) for i in [0...5]

scrape = (msg, category, i) ->
  msg
    .http("https://patch.com/pennsylvania/te/" + "#{category}")
    .get() (err, res, body) ->
      msg.send "#{getNews body, i}"

getNews = (body, i) ->
    $ = cheerio.load(body, i)

    stories = $('section[id="block-system-main"]').children()

    title = stories.eq(i).children().eq(1).children().children().attr('title')
    date = stories.eq(i).children().eq(1).children().children().eq(2).text()
    url = stories.eq(i).children().eq(1).children().children().attr('href')
    "#{title} (#{date}), #{url}"
