//
//  SportsTableData.swift
//  Northwest Connect
//
//  Created by Mallampati,Sai Naveen on 3/18/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import Foundation

class SportsData
{
    let sports:[String]!
    let sportsInfo:[String]!
    let homelinks:[String]!
    let schedulelinks:[String]!
    let rosterlinks:[String]!
    let selectors:[[String]]!
    let statisticslinks:[String]!
    let archivedstorieslinks:[String]!
    var sportSelected:Int = 0
    var sportInfoSelected:Int = 0
    
    
    init()
    {
        sports = ["Baseball","Mens Basketball","Womens Basketball","Softball","Football","Tennis","Soccer","Track and Field"]
        
        sportsInfo = ["Home","Schedule","Roster","Statistics","Archived Stories"]
        
        homelinks = ["http://bearcatsports.com/index.aspx?path=baseball","http://bearcatsports.com/index.aspx?path=mbball", "http://bearcatsports.com/index.aspx?path=wbball", "http://bearcatsports.com/index.aspx?path=softball", "http://bearcatsports.com/index.aspx?path=football", "http://bearcatsports.com/index.aspx?path=tennis","http://bearcatsports.com/index.aspx?path=wsoc", "http://bearcatsports.com/index.aspx?path=track"]
        selectors = [["section,upcoming"],[],[]]
        
        schedulelinks = ["http://bearcatsports.com/schedule.aspx?path=baseball","http://bearcatsports.com/schedule.aspx?path=mbball","http://bearcatsports.com/schedule.aspx?path=wbball","http://bearcatsports.com/schedule.aspx?path=softball","http://bearcatsports.com/schedule.aspx?path=football","http://bearcatsports.com/sports/2014/5/7/tennis%20rosters.aspx","http://bearcatsports.com/schedule.aspx?path=wsoc","http://bearcatsports.com/schedule.aspx?path=track"]
        
        rosterlinks = ["http://bearcatsports.com/roster.aspx?path=baseball","http://bearcatsports.com/roster.aspx?path=mbball","http://bearcatsports.com/roster.aspx?path=wbball","http://bearcatsports.com/roster.aspx?path=softball","http://bearcatsports.com/roster.aspx?path=football","http://bearcatsports.com/roster.aspx?path=tennis","http://bearcatsports.com/roster.aspx?path=wsoc","http://bearcatsports.com/roster.aspx?path=track&"]
        
        statisticslinks = ["http://bearcatsports.com/sports/2014/5/8/baseball%20statistics.aspx?path=baseball","http://bearcatsports.com/sports/2014/4/29/mbb%20stats%20archive.aspx?path=mbball","http://bearcatsports.com/sports/2014/5/20/wbb%20statistics%20archive.aspx?path=wbball","http://bearcatsports.com/sports/2014/5/12/softball%20statistics.aspx?path=softball","http://bearcatsports.com/sports/2014/2/18/fb_record_statistics.aspx?path=football","http://bearcatsports.com/sports/2014/5/7/tennis%20rosters.aspx?path=tennis","http://bearcatsports.com/sports/2014/2/21/soccer_statistics_archive.aspx?path=wsoc","http://bearcatsports.com/sports/2014/2/21/soccer_statistics_archive.aspx?path=wsoc"]
        
        
        archivedstorieslinks = ["http://bearcatsports.com/archives.aspx?path=baseball","http://bearcatsports.com/archives.aspx?path=mbball","http://bearcatsports.com/archives.aspx?path=wbball","http://bearcatsports.com/archives.aspx?path=softball","http://bearcatsports.com/archives.aspx?path=football","http://bearcatsports.com/archives.aspx?path=tennis","http://bearcatsports.com/archives.aspx?path=wsoc","http://bearcatsports.com/archives.aspx?path=track"]
        
    }
}
