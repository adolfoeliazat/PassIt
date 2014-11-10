# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.destroy_all
Category.create(id: '1', category_name: 'Tools')
Category.create(id: '2', category_name: 'Toys')
Category.create(id: '3', category_name: 'Gardening Items')
Category.create(id: '4', category_name: 'Others')

#User.destroy_all
#User.new(:id => '1', :username => 'Jack', :email => 'j@j.j', :encrypted_password => '123', :address => 'Baltimore MD', :phone => '8796543210')
#User.new(:id => '2', :username => 'Ros', :email => 'r@r.r', :encrypted_password => '123', :address => 'Towson MD', :phone => '5461328462')

Item.destroy_all
Item.new(:id => '1', :name => 'Drill', :description => '<!DOCTYPE html><html><head></head><body><p>Mint condition. Like new</p></body></html>',
         :remote_image_url => "http://toolmonger.com/wp-content/uploads/2006/05/standarddrill.jpg",
         :price => 45.99, :keywords => 'tools, drill',
         :category_id => '1', :user_id => '1').save(:validate => false)

Item.new(:id => '2', :name => 'Another Drill', :description => '<!DOCTYPE html><html><head></head><body><p>Brand new. Still in the original box.</p></body></html>',
         :remote_image_url => "http://cdn.dice.com/wp-content/uploads/2012/08/shutterstock_74316340.jpg",
         :price => '65', :keywords => 'tools, drill',
         :category_id => '1', :user_id => '1').save(:validate => false)

Item.new(:id => '3', :name => 'Screwdriver', :description => '<!DOCTYPE html><html><head></head><body><p>Used but in a good condition.</p></body></html>',
         :remote_image_url => "http://www.clipartlord.com/wp-content/uploads/2013/04/screwdriver.png",
         :price => 19, :keywords => 'tools, screwdriver',
         :category_id => '1', :user_id => '2').save(:validate => false)

Item.new(:id => '4', :name => 'Toy', :description => '<!DOCTYPE html><html><head></head><body><p>Very useful if you have a child.</p></body></html>',
         :remote_image_url => "http://www.frenchblossom.com/1314-2620-thickbox/bird-of-paradise-pull-along-toy.jpg",
         :price => 8.99, :keywords => 'toys, fun',
         :category_id => '2', :user_id => '2').save(:validate => false)

Item.new(:id => '5', :name => 'Bike', :description => '<!DOCTYPE html><html><head></head><body><p>This bike will make crazy.</p></body></html>',
         :remote_image_url => "http://salsacycles.com/files/bikes/bikes_Mukluk2_2013_2.jpg",
         :price => 145.45, :keywords => 'bike, workout',
         :category_id => '4', :user_id => '1').save(:validate => false)

Item.new(:id => '6', :name => 'DEWALT DC825 18 Volt Cordless Impat Driver Lithium-Ion or XRP DC825B BRAND NEW', :description => '<!DOCTYPE html><html lang="en" xmlns:og="http://opengraphprotocol.org/schema/" xmlns:fb="http://www.facebook.com/2008/fbml"><head></head><body class=" vi-contv2 lhdr-ie- vi-hd-ops "><div class="tab-pane active"><div class="vi-VR-tabCnt"><div id="vi-desc-maincntr" class=""><div class="sh-cnt u-cb"><div class="sh-hdr" style="background-color: #3333ff;"><div class="sh-vs u-flR" style="color: #ffffff;">Visit my eBay store</div><div class="sh-vs u-flR" style="color: #ffffff;">&nbsp;<u></u><a href="http://contact.ebay.com/ws/eBayISAPI.dll?ShowSellerFAQ&amp;iid=1&hellip;&amp;rt=nc&amp;_trksid=p2047675.l1499&amp;ssPageName=PageSellerM2MFAQ_VI">Ask a question <strong class="hideforacc"> - opens in a new window or tab </strong> </a></div></div></div><div class="asqMain"><div class="asqHeader section-ttl"><div class="tab-pane "><div class="vi-VR-tabCnt"><div id="readMoreShp" class="ds-lgl-txt u-cb vi-readMore-ship readMore">Seller assumes all responsibility for this listi</div><div id="vi-retpol-maincntr" class="">If we want to make a parapraph, what it tacks to do that this is randome text to generate a pragraph tag in this page I hope to be shown up on the website spicialy the small description part I did what ever I this this is enough</div></div></div><h3><u><em><strong>Questions and answers about this item</strong></em></u></h3><div class="rd-sep"><h3><u><em><strong>Questions and answers about this item</strong></em></u></h3><h3>No questions or answers have been posted about &hellip;</h3></div></div></div></div></div></div><div id="Body" class="sz940 sz1280"><div id="BottomPanel" style="margin-bottom: 10px;"><div class="tabbable"><div class="tab-content-m"><div class="tab-pane active"><div class="vi-VR-tabCnt"><div id="vi-desc-maincntr" class=""><!--call this inside Tab for Item description--><!--TODO: remove hardcoded ID--><div class="itemAttr"><div class="section"><table style="height: 338px;" width="693" cellspacing="0" cellpadding="0"><tbody><tr><td class="attrLabels">The table that filled in the editor</td><td width="50.0%">second col of the same table</td><td class="attrLabels">this acts as a number houlder for the near by fields</td><td width="50.0%">I gues items goes here as wil</td></tr><!--Added for see review link--></tbody></table></div></div></div></div></div></div></div></div></div><!--RcmdId _vi_index-jsp,RlogId t6ulcpjqcj9%3Fuk%600d…--><p>&nbsp;</p></body></html>',
         :remote_image_url => "http://i.ebayimg.com/00/s/NTQ3WDQzNw==/$(KGrHqN,!rkFBCW69I9hBQf+rk0D(!~~60_12.jpg",
         :price => 20, :keywords => 'drill, workout',
         :category_id => '1', :user_id => '2').save(:validate => false)

puts "Success: The data has been successfully populated."