#!/usr/bin/env ruby

# Add the following line in your ~/.bashrc
# alias score = "ruby <path_to_script>.rb"
# Now whenever you want to check score just type score on Terminal

# If you want to get update every X seconds then type the following on your Terminal
# watch -n X score 

require 'open-uri'
require 'libnotify'
require 'nokogiri'

url = "http://synd.cricbuzz.com/j2me/1.0/livematches.xml"
#url = "http://static.cricinfo.com/rss/livescores.xml"
file = Nokogiri::XML(open(url))

tournament = file.at_xpath("/mchdata/match/@srs").to_s
match_desc = file.at_xpath("/mchdata/match/@mchDesc").to_s
match_number = file.at_xpath("/mchdata/match/@mnum").to_s
venue =  file.at_xpath("/mchdata/match/@grnd").to_s
match = match_desc + " , " + venue


match_status = file.at_xpath("/mchdata/match[1]/state/@status").to_s
batting_team = file.at_xpath("/mchdata/match[1]/mscr/btTm/@sName").to_s
batting_team_runs = file.at_xpath("/mchdata/match[1]/mscr/btTm/Inngs/@r").to_s
batting_team_wickets = file.at_xpath("/mchdata/match[1]/mscr/btTm/Inngs/@wkts").to_s
batting_team_overs = file.at_xpath("/mchdata/match[1]/mscr/btTm/Inngs/@ovrs").to_s

bowling_team = file.at_xpath("/mchdata/match[1]/mscr/blgTm/@sName").to_s
bowling_team_runs = file.at_xpath("/mchdata/match[1]/mscr/blgTm/Inngs/@r").to_s
bowling_team_wickets = file.at_xpath("/mchdata/match[1]/mscr/blgTm/Inngs/@wkts").to_s
bowling_team_overs = file.at_xpath("/mchdata/match[1]/mscr/blgTm/Inngs/@ovrs").to_s

current_run_rate = file.at_xpath("/mchdata/match[1]/mscr/inngsdetail/@crr").to_s
partnership = file.at_xpath("/mchdata/match[1]/mscr/inngsdetail/@cprtshp").to_s

innings_details = "Current Run Rate - "+ current_run_rate + " , " + "Partnership - " +partnership
  
batting_stat = batting_team + " - " + batting_team_runs+"/"+batting_team_wickets + " , Overs - "+ batting_team_overs
bowling_stat = bowling_team + " - " + bowling_team_runs+"/"+bowling_team_wickets + " , Overs - "+ bowling_team_overs

status = batting_stat + "\n" + bowling_stat + "\n" + innings_details + "\n" +match_status

Libnotify.show(:body => status,:summary => match, :timeout => 3)