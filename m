From: "Dirk H. Schulz" <dirk.schulz@kinzesberg.de>
Subject: conntrackd working, but netfilter not impressed
Date: Mon, 11 Aug 2008 12:50:46 +0200
Message-ID: <BD9F23BEBBF883939AE367D6@Dirks-MacBook-Pro.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi folks,

I am in the process of setting up a redundant router/firewall cluster. That 
means: 2 routers, connected to 2 upstream routers, using OSPFv2 for 
routing. OS is Centos 5.2.

Both have also firewalls configured. Since using OSPF I cannot avoid 
asynchronous routing perfectly, so I have installed conntrack-tools to 
synchronize the connection tracking tables of the firewalls.

conntrackd seems to work fine - using "conntrackd -e" I can see entries 
having been synchronized over from the other router - and vice versa.

But testing it practically it failes nonetheless. This is what I tested:

1. Ping from a server to the outside (internet).
2. I can see the ping packets leave via router2 and the answer come back in 
via router1.
3. conntrackd -e on router1 shows exactly this connection, so it has been 
replicated from router2 to router1
4. netfilter on router1 blocks the incoming packets as being new (I check 
that via log prefixes)

That looks like conntrackd is sync'ing over the connection table entries, 
but not writing them into the kernel's connection tracking table. I have 
set "CacheWriteThrough" to "on" to achieve that. The logs do not show 
anything at all (just the startup messages).

Googling for "active-active" setup of conntrackd show some hints on special 
configuration this setup needs, but the documentation does not list any.

So I am stuck. Any help or hint is appreciated. Here is my setup:
> Sync {
> 	Mode FTFW {
> 		ResendBufferSize 262144
> 		CommitTimeout 180
> 		ACKWindowSize 20
> 	}
> 	Multicast {
> 		IPv4_address 225.0.0.50
>		IPv4_address ROUTERLINKADDRESS
> 		Interface eth1
> 		Group 3780
> 	}
> 	Checksum on
> 	CacheWriteThrough On
> }
> General {
> 	HashSize 8192
> 	HashLimit 65535
> 	LogFile /var/log/conntrackd.log
> 	Syslog on
> 	LockFile /var/lock/conntrack.lock
> 	UNIX {
> 		Path /tmp/sync.sock
> 		Backlog 20
> 	}
> 	SocketBufferSize 262142
> 	SocketBufferSizeMaxGrown 655355
> }
> IgnoreTrafficFor {
> 	IPv4_address INTERROUTERINTERFACE
> 	IPv4_address EXTERNALINTERFACE
> 	IPv4_address INTERNALINTERFACE1
> 	IPv4_address INTERNALINTERFACE2
> 	IPv4_address INTERNALVIRTUALIP
> }
>
> IgnoreProtocol {
> 	IGMP
> 	VRRP
> }



Dirk
