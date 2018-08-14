cheerio = require 'cheerio'

module.exports = (robot) ->

  robot.respond /patch help/i, (help) ->
    help.send "Type \"axel, show me the latest patch about ______\" and I'll tell you the five most recent stories in that category."
    help.send "Valid categories include \"TESD,\" \"the main line,\" \"sports,\", \"business,\" \"weather,\" \"the authorities,\" \"politics,\" \"obituaries\" and \"traffic.\""
    help.send "I'd say that only the first five really matter to you, though."
    help.send "If you say \"anything\" as the category, then I'll choose a category for you."

  robot.respond /show me the latest patch about (.*)/i, (msg) ->

    category = msg.match[1].trim()
    categories = [
      'weather'
      'police-fire'
      'obituaries'
      'schools'
      'traffic-transit'
      'sports'
      'politics'
      'business'
      'around-town'
    ]

    if category is 'authorities' or category is 'law enforcement' or category is 'the authorities'
      category = 'police-fire'
    else if category is 'tesd' or category is 'TESD'
      category = 'schools'
    else if category is 'traffic and transit' or category is 'traffic' or category is 'transit' or category is 'traffic & transit'
      category = 'traffic-transit'
    else if category is 'politics and government' or category is 'the government' or category is 'gov'
      category = 'politics'
    else if category is 'community' or category is 'the main line' or category is 'the community'
      category = 'around-town'
    else if category is 'anything' or category is 'random' or category is 'something'
      category = msg.random categories
      msg.send "Here's the latest news on " + category + "."
    else
      if categories.indexOf category < 0
        msg.send "Sorry, that's an invalid category! If this is supposed to work, yell at Justin."
        msg.send "If you're confused, type \"axel, patch help.\""
        return

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
