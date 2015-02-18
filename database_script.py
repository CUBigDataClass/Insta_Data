import urllib.request, json
from pymongo import MongoClient # you need to install the pymongo package (the windows one is included)

client = MongoClient('localhost', 27017)
db = client.test

collection = db.testData

# in the next line you need to put your access token in at: {token}
stuff = urllib.request.urlopen("https://api.instagram.com/v1/locations/3182100/media/recent?access_token={token}").read()

string = stuff.decode("utf-8", "strict")
j = json.loads(string)

posts = db.posts
post_id = posts.insert(j)