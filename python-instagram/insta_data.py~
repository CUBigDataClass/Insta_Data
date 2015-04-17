from instagram import client, subscriptions
from pymongo import MongoClient

connection = MongoClient('localhost', 27017)
db = connection.insta_data1

session_opts = {
    'session.type': 'file',
    'session.data_dir': './session/',
    'session.auto': True,
}

CONFIG = {
    'client_id': '<client_id>',
    'client_secret': '<client_secret>',
    'redirect_uri': 'http://localhost:8515/oauth_callback'
}

#access token=4689265.35307b6.392bd0f97a694647baeded2c94e041b6
#client_id: 35307b66147846e696b719184e85cb66
#client_secret: f494c43f43c44fe4b5ba8d97deec3086

api = client.InstagramAPI(access_token='4689265.35307b6.392bd0f97a694647baeded2c94e041b6')
#media_popular = api.media_search(lat="37.7808851",lng="-122.3948632",distance=1000)
media_popular = api.media_popular()

db[]

for media in media_popular:
	try:
		print media.get_standard_resolution_url()		#get image url
		print media.like_count		#get number of likes
		print media.tags		#get all tags in an array
		print media.location

	except Exception as e:
		print e