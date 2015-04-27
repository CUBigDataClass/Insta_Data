from pymongo import MongoClient
from collections import defaultdict
from datetime import date, timedelta, datetime
import time

connection = MongoClient('localhost', 27017)
db = connection.insta_data

while(True):

	tagToPosts = defaultdict(list)
	tagToCount = defaultdict(int)
	postToLikes = defaultdict(int)
	postToUrl = defaultdict(str)

	things = db.posts2.find({
	    "datetime" : {"$gte": datetime.utcnow() - timedelta(days=1)}
	})
	# i = 0

	for q in things:
		for t in q["tag"]:
			tagToPosts[t].append(q["id"])
			tagToCount[t] += 1
		postToLikes[q["id"]] = int(q["likes"])
		postToUrl[q["id"]] = q["imageurl"]

	maxy = 0
	maxTag = ""

	for k in tagToCount:
		# print(k)
		if tagToCount[k] > maxy:
			maxy = tagToCount[k]
			maxTag = k

	stuff = []

	for p in tagToPosts[maxTag]:
		stuff.append((postToLikes[p],postToUrl[p]))

	stuff.sort(reverse=True, key=lambda tup: tup[0])

	field = {'id':1,'current':stuff, 'tag':maxTag}

	db.current.update({'id':1}, field, upsert = True)

	time.sleep(10*60)



# print(maxTag)
# print(stuff)

# print(str(tagToCount))
# print(tagToPosts)
# print(postToUrl)
# print(postToLikes)
