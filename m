From: "Brent Kuster" <Brent.Kuster@wane.com>
Subject: Migrating machines from old subnet to multiple new subnets
Date: Thu, 1 Oct 2009 16:38:50 -0400
Message-ID: <F7AE1DB54FEEEC4CA35163A99A7DF36403565EA6@WANEMAIL.WANE.LINTV.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org



So there I was....

Having walked into the place, it was clear, that the old Sys Admin had
used up all the space- IP Space that it.  Everything in the building was
operating on a /24 network, and I mean everything.  It was a small
building, so we were slumping along, but we were quickly running out of
available IP's.

I decided that I had better change things, and fast.  So, I asked corp
for a new /16 space, which they gave me after much complaining and
grinding of teeth, which I have divided up into several /24 spaces.
	Not exhaustive, but something like this:

		Server 1	192.168.10.5  ->	10.10.1.10
		Server 2	192.168.10.6  ->	10.10.1.11
		Acct 1	192.168.10.7  ->	10.10.20.10
		Eng 2		192.168.10.8  ->	10.10.30.10
		Sales 1	192.168.10.21  ->	10.10.50.10
		Sales 2	192.168.10.22  ->	10.10.50.11
		Etc.

Now, I've been in the shop getting to know some of the tools that I'd
need- 	iptables
	ebtables
	brouting
	proxy_arp
	ip_forward
	DNAT / SNAT / MASQUERADE
	
but alas, I need you're help to solve the mystery:


How can I migrate hosts from a 192.168.10.0/24 network to a selection of
10.10.x.0/24 networks in a fashion that will allow machines in new space
trying to contact old machines in OLD space to be redirected AND at the
same time, allow old machines in old space to contact migrated host on
new network?
	Example:
	Server 1 (old = 192.168.10.5) gets moved to the new IP
10.10.1.10.
	Now, when server 2 (still in old space) tries to contact the old
IP 192.168.10.5 it gets redirected to the new 10.10.1.10, AND when a
host in the new space tries to contact Server 1 at the old address, it
also gets redirected to the new IP.

There are so many hard coded items in existence today, that I need to
find a way to track the hosts/apps that are trying to contact the old IP
and forward/redirect/masquerade & log to the new IP.  Simply waiting for
DNS caches to update with the new IP will not be sufficient.  We have
many systems with hand coded lmhosts files that will be trying to reach
machines on the old subnet even though DNS has been updated.

I've had some limited success with iptables, but only for connections
routing at layer 3 through my ubuntu router, but not for hosts still on
the old subnet at layer 2.  Then I tried proxy_arp, but that stopped the
routing, because the server was acting as the MAC of the old IP, and not
forwarding it on.


In a perfect world, I _think_ I would want to do this:

Configure the Ubuntu (or other linux) router to fully masquerade all
ports (untouched implicitly or otherwise) from old to new IP on a 1to1
basis.  Unfortunately, I've read that masquerade is for 1-to-many, and
not many-to-many.

I need a solution that will allow for stateful and secure connections to
work.  In particular, I'm concerned that my IP security will fail
because of detected 'spoofing'.

Any suggestions?


