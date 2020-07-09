From: Stephen Satchell <list@satchell.net>
Subject: Plan B on BCP-38 implementation in NFTABLES
Date: Thu, 9 Jul 2020 07:14:57 -0700
Message-ID: <4fb20696-a5a7-a7d4-b1df-b152e472128f@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Because I don't seem to be able to get the FIB statements in nft working 
as I expect, I've decided to move to Plan B in my edge routers: 
autogenerating ip sets, from the routing table, on my own.

The idea is to read the routing table from /proc/net/routes and rebuild 
the table.  Include a configuration file that details all static inside 
netblocks and all static blackhole netblocks not contained in the 
routing table.  Then build any desired set from there.  For example:

source-dest-block list:  all network (like 127.0.0.0/8), all broadcast 
(like 127.255.255.255/8), and all blackhole.

I run Red Hat Enterprise, so I can use NetworkManager hooks to trigger 
dynamic changes to the routing table, such as when a VPN client has 
established a connection.  This facilitates site-to-site VPN links and 
similar.

A fun little weekend Python 3 project.

(I looked to see if anyone else had done this, and didn't find anything.)
