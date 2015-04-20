from instagram import client, subscriptions
from pymongo import MongoClient
from __future__ import (
	print_function,
	unicode_literals,
	)
import json
import time

connection = MongoClient('localhost', 27017)
db = connection.insta_data


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
i = 0
# db[]
while(i < 10000):
	media_popular = api.media_popular()
	for media in media_popular:
		try:
			# print(type(media.created_time))
			
			tags = [tag.name for tag in media.tags]
			likes = media.like_count
			url = media.get_standard_resolution_url()

			location = {}
			try:
				location = {"latitude":media.location.point.latitude,"longitude":media.location.point.longitude}
			except Exception as e:
				location = {"latitude": 0,"longitude": 0}

			datetime = media.created_time
			username = media.user.username
			postid = media.id
			field = {"id":postid, "username":username, "imageurl":url, "likes":likes, "tag":tags, "location":location, "datetime":datetime}

			db.posts.update({"id":postid},field, upsert = True)
			i = i + 1

		except Exception as e:
			pass
			# print( e)
	time.sleep(5)
