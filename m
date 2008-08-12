From: "Dirk H. Schulz" <dirk.schulz@kinzesberg.de>
Subject: CacheWriteThrough or commiting to the kernel table does not work
Date: Tue, 12 Aug 2008 13:07:11 +0200
Message-ID: <81874E4FCE5CF65E336A0B85@file.wkd-druck.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi folks,

I try it once more after looking more deeply into it.

I have a setup with 2 routers/firewalls using OSPF to 2 upstream routers. 
Because of OSPF I do not have connection persistency, i.e. packets 
belonging to a certain connection  must be able to pass both firewalls.

So I installed conntrack-tools (current version) using a ftfw setup on both 
routers/firewalls. I switched CacheWriteThrough to on, because
> 	# If you have a multiprimary setup (active-active) without connection
> 	# persistency, ie. you can't know which firewall handles a packet
> 	# that is part of a connection, then you need direct commit of
> 	# conntrack entries to the kernel conntrack table. OSPF setups must
> 	# set on this option. Default is Off.
> 	#
> 	CacheWriteThrough On

To me that sounds that I do not have to commit the external cache manually 
(via conntrackd -c) because it is committed automatically.

But when I test the setup, it does not work. Here are the details again:
1. I make a test ping from a server to the outside. The ping leaves via 
router2, the answer comes in via router1.
2. I use "conntrackd -e" on router1 to make sure the connection has been 
sync'd over from router2 to router1.
3. The firewall on router1 blocks the incoming packet.
4. Disabling the firewall makes the packets pass.

I can only interpret that as CacheWriteThrough does not work. So I made 
another test: I setup a script that calls "conntrackd -c" every 5 seconds 
and let a long stream of pings and http calls run - the packets on router1 
were still blocked.

That leads me to the conclusion that committing the cache to the kernel 
table does not work at all. How can I test specifically that?

And how can I solve this problem? Any hint or help is appreciated. I can 
post the conntrackd.conf, if it is of any use. The conntrackd logfile does 
not contain anything besides startup messages.

Please help!

Dirk
