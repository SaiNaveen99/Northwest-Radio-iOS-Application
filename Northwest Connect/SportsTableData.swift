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
    let links:[String]!
    let selectors:[[String]]!
    
    init()
    {
        sports = ["Baseball","Mens Basketball","Womens Basketball","Softball","Football","Tennis","Soccer","Track and Field"]
        
        sportsInfo = ["Events","Results","Schedule","Roster"]
        
        links = ["http://bearcatsports.com/index.aspx?path=baseball","http://bearcatsports.com/index.aspx?path=mbball", "http://bearcatsports.com/index.aspx?path=wbball", "http://bearcatsports.com/index.aspx?path=softball", "http://bearcatsports.com/index.aspx?path=football", "http://bearcatsports.com/index.aspx?path=tennis","http://bearcatsports.com/index.aspx?path=wsoc", "http://bearcatsports.com/index.aspx?path=track"]
        selectors = [["section,upcoming"],[],[]]
        
    }
}
/*
1244
598
*/