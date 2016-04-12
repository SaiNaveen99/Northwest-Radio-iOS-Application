//
//  SportsTableData.swift
//  Northwest Connect
//
//  Created by Mallampati,Sai Naveen on 3/18/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import Foundation

class SportsTableData
{
    let sports:[String]!
    let sportsInfo:[String]!
    let homelinks:[String]!
    let schedulelinks:[String]!
    let rosterlinks:[String]!
    let selectors:[[String]]!
    let statisticslinks:[String]!
    let archivedstorieslinks:[String]!
    
    
    init()
    {
        sports = ["Baseball","Mens Basketball","Womens Basketball","Softball","Football","Tennis","Soccer","Track and Field"]
        
        sportsInfo = ["Events","Results","Schedule","Roster","Statistics","Archived Stories"]
        
        homelinks = ["http://bearcatsports.com/index.aspx?path=baseball","http://bearcatsports.com/index.aspx?path=mbball", "http://bearcatsports.com/index.aspx?path=wbball", "http://bearcatsports.com/index.aspx?path=softball", "http://bearcatsports.com/index.aspx?path=football", "http://bearcatsports.com/index.aspx?path=tennis","http://bearcatsports.com/index.aspx?path=wsoc", "http://bearcatsports.com/index.aspx?path=track"]
        selectors = [["section,upcoming"],[],[]]
        
        schedulelinks = ["http://bearcatsports.com/schedule.aspx?path=baseball"]
        rosterlinks = ["http://bearcatsports.com/roster.aspx?path=baseball"]
        statisticslinks = ["http://bearcatsports.com/sports/2014/5/8/baseball%20statistics.aspx?path=baseball"]
        archivedstorieslinks = ["http://bearcatsports.com/archives.aspx?path=baseball"]
        
    }
}
