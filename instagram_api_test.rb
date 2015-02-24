# need to run: gem install instagram
require 'instagram'
require 'openssl'

# not sure why you need this
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Instagram.configure do |config|
    config.access_token = #{access_token}
    end

tagCount = Hash.new(0)
tagToIds = Hash.new([])
idToInfo = Hash.new({})

while idToInfo.length<3
	ret = Instagram.media_search("40.0274", "-105.2519", {:distance => '5000'})

	ret.map { |e1| 
		unless idToInfo.has_key?(e1.id)
			e1.tags.map{ |e2| 
				tagCount[e2]+=1; 
				tagToIds[e2]+=[e1.id] 
			}; 
			idToInfo[e1.id]={'likes'=>e1.likes.data.length, 'image'=> e1.images.standard_resolution}
		end 
	}
	sleep(1)
end

# ret = Instagram.media_search("40.0274", "-105.2519", {:distance => '5000'})
# puts ret[2].id

puts tagCount
puts tagToIds
puts idToInfo

#<Hashie::Mash attribution=nil caption=#<Hashie::Mash created_time="1424738129" from=#<Hashie::Mash full_name="CATEYE BRAND" id="5214572" profile_picture="https://igcdn-photos-a-a.akamaihd.net/hphotos-ak-xpf1/t51.2885-19/10598786_710953325638088_1611830274_a.jpg" username="bf_hoodrich"> id="927093082351433540" text="A Favorite."> comments=#<Hashie::Mash count=0 data=[]> created_time="1424738129" filter="Ludwig" id="927093082041054960_5214572" images=#<Hashie::Mash low_resolution=#<Hashie::Mash height=306 url="http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/s306x306/e15/10990575_1377171169267431_1979217988_n.jpg" width=306> standard_resolution=#<Hashie::Mash height=640 url="http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/e15/10990575_1377171169267431_1979217988_n.jpg" width=640> thumbnail=#<Hashie::Mash height=150 url="http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/s150x150/e15/10990575_1377171169267431_1979217988_n.jpg" width=150>> likes=#<Hashie::Mash count=4 data=[#<Hashie::Mash full_name="chiangggg" id="5256248" profile_picture="https://instagramimages-a.akamaihd.net/profiles/profile_5256248_75sq_1357009889.jpg" username="chiangggg">, #<Hashie::Mash full_name="Mike" id="241376076" profile_picture="https://igcdn-photos-a-a.akamaihd.net/hphotos-ak-xpf1/t51.2885-19/1742591_389494471232040_860611109_a.jpg" username="slothish">, #<Hashie::Mash full_name="Barry Lee" id="30765922" profile_picture="https://instagramimages-a.akamaihd.net/profiles/profile_30765922_75sq_1392849466.jpg" username="barrydraws">, #<Hashie::Mash full_name="rowdyrowdy boutitboutit" id="31430940" profile_picture="https://instagramimages-a.akamaihd.net/profiles/profile_31430940_75sq_1334781812.jpg" username="bonesawjonez">]> link="https://instagram.com/p/zdsj8Ex3bw/" location=#<Hashie::Mash latitude=37.779775 longitude=-122.394478333> tags=[] type="image" user=#<Hashie::Mash bio="" full_name="CATEYE BRAND" id="5214572" profile_picture="https://igcdn-photos-a-a.akamaihd.net/hphotos-ak-xpf1/t51.2885-19/10598786_710953325638088_1611830274_a.jpg" username="bf_hoodrich" website=""> user_has_liked=false users_in_photo=[]>
