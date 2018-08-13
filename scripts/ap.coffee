module.exports = (robot) ->

	robot.respond /help/i, (res) ->
		res.send "Try typing \"axel, teach me about ______ in AP style\" and I'll help you out!"
		res.send "If you're just starting out, I recommend learning about punctuation, dates, numbers, names and references first."
		res.send "A full list of possible queries can be found if you ask \"axel, what can I ask?\""
		res.send "If something doesn't work, feel free to yell at Justin."

	robot.respond /what can I ask/i, (res) ->
		res.send "Ask me about abbreviations, acronyms, addresses, ages, capitalization, dates, degrees, locations, measurements, money, names, numbers, Oxford commas, percentages, punctuation, references, time and titles!"
		res.send "Type \"axel, teach me about ______ in AP style\" and put one of the words above in the blank."
		res.send "If you feel really apathetic, just ask \"axel, teach me about something in AP style\" and I'll spit out a random fact."

	robot.respond /teach me about (.*) in AP style/i, (res) ->
		query = ""

		if res.match[1] is "something"
			options = ["abbreviations", "acronyms", "addresses", "ages", "capitalization", "dates", "degrees", "locations", "measurements", "money", "names", "numbers", "Oxford commas", "percentages", "punctuation", "references", "time", "titles"]
			query = res.random options
			res.send "You spinned " + query + "."
		else
			query = res.match[1]

		if query is "dates"
			res.send "Dates should have abbreviated months, then date as an Arabic figure, and then the year." +
				"However, if you're only specifying the month without the day, you may write it out. Capitalize and write out days of the week" +
				" Don't start sentences with dates!"
			res.send "The abbreviations of months are Jan., Feb., Aug., Sept., Oct., Nov., and Dec."
			res.send "For example, Justin was born on Feb. 9, 2001. School started in August 2018 this year, and runs Monday through Friday."
		else if query is "numbers"
			res.send "Numbers can be annoying because there are lots of exceptions."
			res.send "Write out the numbers one to nine and then use numerals from beyond 10. Use commas to separate groups of three digits in big numbers (666,666). Use decimals with up to two places for numbers in the" +
				" millions and billions, like 7.44 billion."
			res.send "Spell out numbers in the beginning of sentences; however, starting sentences with numbers is generally discouraged."
			res.send "Add an s at the end of plural numbers, but don't use an apostrophe. For example, Justin likes music from the 1980s. In a quote, if somebody says \"the eighties,\", write it as the '80s."
			res.send "Exceptions include addresses, ages, money, dates, measurements, highways, percentages, speed, temperature and time. Ask me for those conventions if that's what you're looking for."
		else if query is "degrees"
			res.send "Use apostrophes and spell the degrees out, unless there are a bunch of them in credentials."
			res.send "For example, I don't have a bachelor's degree, but then there are people like Connie Stoga, LL.D., Ph.D., from Harvard."
		else if query is "acronyms"
			res.send "Don't use them."
			res.send "Just kidding. There are some acronyms that are accepted if they're very common, like radar, but if a reader might not know what you're referring to, don't use the acronym." +
				" If you have a long title like the Department of Justice, spell it out on first mention and then refer to it by a general term, like \"the department.\""
			res.send "And no, you can't just write \"The Department of Justics (DOJ)\" and get away with it."
			res.send "Many people confuse acronyms with abbreviations, too. Ask me to help you with abbreviations just in case, because AP Style treats them differently."
		else if query is "abbreviations"
			res.send "Similar to acronyms, don't use abbreviations unless they're commonly recognized by readers, like gigabytes as GB, but even then, consider spelling it out. Also, most AP Style abbreviations use periods, like in a.m. and p.m."
			res.send "Don't follow an organization with its name abbreviated in paranthesis like Dichlorodiphenyltrichloroethane (DDT)."
			res.send "Abbreviations are commonly used in other AP Style rules, like degrees and titles, so ask me for those for a more specific answer."
		else if query is "addresses"
			res.send "If writing the name of a street, spell out the street name completely. With a specific address, you may abbreviate the generic part of the name."
			res.send "For example, TEMS is on Conestoga Road, but Conestoga's address is 200 Irish Rd."
		else if query is "capitalization"
			res.send "This one's kind of annoying, but generally follows common conventions."
			res.send "Don't capitalize words unless they're part of formal names. For example, the Department of Defense versus the department. Common nouns in formal names are also capitalized, like a river versus the Delaware River."
			res.send "Directions like north, south, east, west are lowercase unless referring to a specific name, like the Northeast or the West Coast."
			res.send "Capitalize rooms if they refer to a specific room, like Room 280A or the Million-Dollar Room."
			res.send "Other capitalization problems are covered in titles, so ask me about those to hear about them."
		else if query is "time"
			res.send "Use numerics except for noon and midnight, and use a.m. or p.m. (with the periods). Don't use \"in the morning\" or \"o'clock\" or anything like that."
			res.send "For example, school starts at 7:20 a.m. and I go to sleep at 10 p.m. If you're awake after midnight, that's unfortunate."
		else if query is "titles"
			res.send "Capitalize formal titles if they appear before the person's name, and make them lowercase if they're informal, are used without a name, follow a person's name or refer to a name with commas."
			+ " Long titles come after the name. Don't use courtesy titles like Ms., Mr., Mrs., etc. unless you have multiple people with the same last name in an article."
			+ " Some titles can be abbreviated, like Dr., Gov., Rep. and the Rev."
			res.send "For example, President Donald Trump met with the president of Russia, Vladimir Putin, and Kim Jong-un, the leader of North Korea, in 2018."
			res.send "Sometimes AP Style titles have some caveats, so if you're not sure and I didn't help you, Google it to figure that out."
			res.send "If you're looking for referencing works and compositions, ask me about \"references.\""
		else if query is "ages"
			res.send "Always use numerics when referring to ages. Hyphenate ages as adjectives."
			res.send "For example, Avery and Justin 17 years old, but there are 18-year-old seniors already. Soon, they'll be in their 20s. You must be 21 to purchase alcohol."
		else if query is "Oxford commas"
			res.send "Don't use them."
			res.send "...unless you have a complex series like \"AP Physics, AP Language and Composition, and AP Calculus BC.\""
		else if query is "references"
			res.send "Put quotation marks around titles of books, music, shows, games, literature, art and lectures. Never underline. Exceptions to this rule include magazines, newspapers and the Bible, which don't need any special notation."
			res.send "For example, the Philadelphia Inquirer reviewed \"Black Panther\" a while ago."
		else if query is "measurements"
			res.send "Always use numerics and spell out units, like inches and feet. However, with miles, use the normal number rules (spell out anything below 10). If the measurement is used as an adjective, hyphenate it."
			res.send "For example, Conestoga is 20 miles northwest of Philadelphia and the two-mile drive from there to Wawa takes little time."
		else if query is "percentages"
			res.send "Use a numeric no matter what, and spell out \"percent.\" For example, 90 percent of the world's digital data was created in the last two years."
		else if query is "locations"
			res.send "State abbreviations are very annoying. Spell out states by themselves, but abbreviate when used with cities. AP Style state abbreviations are different from postal code abbreviations, so you'll have look them up. For example, Pennsylvania's abbreviation is \"Pa.,\" with the period."
			res.send "Some cities, like Philadelphia and Pittsburgh, don't need to be accompanied by the state name, but \"Berwyn, Pa.\" is necessary."
			res.send "If you're referring to the capital, use \"Washington D.C.\" or \"District of Columbia.\""
			res.send "Some countries are abbreviated, like U.S. and U.K., but I would encourage you to Google other ones."
		else if query is "names"
			res.send "On the first mention, always use the person's first and last name, as well as any relevant titles (\"senior Connie Stoga\"). Any other references use last name only. If two people have the same last name, use courtesy titles to differentiate."
			res.send "If senior Connie Stoga won an award for curing cancer, the rest of the article would refer to them as \"Stoga.\""
		else if query is "punctuation"
			res.send "For basic AP Style punctuation, common conventions are used, but some things are different. Ask me about Oxford commas as an example."
			res.send "Single quotation marks are used for quotes within quotes. \"Also, commas and periods go inside quotes,\" but em dashes, semicolons and question marks go outside \"if they apply to the whole sentence,\"—not just the quote."
			res.send "Avoid semicolons (unless you have a complex series) and colons, as you'll become best friends with the em dash. Use hyphens—the en dash—for compound adjectives like twice-derived functions."
			res.send "Add an apostrophe after possessives with plural nouns ending in s (students' grades), but singular nouns ending in s use apostrophe-s (class's grades). Singular names ending in s only add an apostrophe (Darius' axe). Plural letters get apostrophe-s (all A's on a report card)."
			res.send "Avoid using parentheses and try to replace them with em dashes."
		else if query is "money"
			res.send "Money always stays in numeric form, where the number is preceded by a dollar sign, and you generally drop the cents unless you're going for a specific journalistic effect. I would have $20 in my wallet if robots had wallets."
			res.send "For big sums, stick with the usual number rule but stick a dollar sign there. I wish a bank approved my small loan of $1 million dollars."
			res.send "If all you've got in your pocket is change, though, don't use the dollar sign and instead spell out \"cents.\" Maybe 47 cents is in my couch."
		else
			res.send "Sorry, I don't know that. Try checking the stylebook or the AP Twitter feed. You'll be surprised by what you can learn."
			return

		bye = ["I hope that answers your question!", "Feel free to ask me anything else!", "Hopefully that helps you out!", "Good luck!"]

		res.send res.random bye
