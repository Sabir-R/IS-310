library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)
poemList <- xml_find_all(doc, "//lg")
poemList
chapterList <- xml_find_all(doc, "//div")
chapterList

# "Where the Northern Ocean" is from Chapter I
# "In the days when" is from Chapter III
# "My feet they are sore" is from Chapter III
# Why did they send me is from Chapter III
# Yet distant and soft is from Chapter III
# Ev'n should I is from Chapter III
# There is a thought is from Chapter III
# "Like heath that" is from Chapter XII
# "The truest love" is from Chapter XXIV
#  Her coming was my is from Chapter XXIV
# I dreamed is from Chapter XXIV
# But\n wide is from Chapter XXIV
# And haunted is from Chapter XXIV
# I dangeres dared is from Chapter XXIV
# On sped my\n is from Chapter XXIV
# Still bring is from Chapter XXIV
# I care not is from Chapter XXIV
# Though haughty is from Chapter XXIV
# My love has\n is from Chapter XXIV
# My love has sworn is from Chapter XXIV
>>>>>>> origin/table5new
