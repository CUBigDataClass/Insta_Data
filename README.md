# Insta_Data

## The Force

**Team Members:**
    Priya Sudendra,
    Sheefali Tewari,
    Noah Dillion,
    Steve Rowell, 
    Chris Rooney,
    Kyle Rooney

**Project:** Analyze Instagram data to find most popular/trending hashtags as well as the most liked pictures using those hashtags.

**Running EC2 Instance:**
<<<<<<< HEAD

=======
>>>>>>> 9eee2511c7d29f060e0c2ecab321963bee5ed59d
1. Find "Insta_Data.pem" file and move it to a location you can easily access and go to folder.
2. Run: chmod 400 Insta_data.pem
3. ```ssh -i Insta_Data.pem ec2-user@ec2-52-10-211-62.us-west-2.compute.amazonaws.com```

**Accessing MongoDB**
Once on the EC2 instance:
```
mongo
show dbs
use insta_data
db.posts.find()
```

=======

**How to Run Insta_Data:** 

::

    py.test /insta_data/tests
