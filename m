From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: Dual Internet Connection
Date: Thu, 4 Jul 2002 17:03:30 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA224@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'dcrooks@succeed.net'" <dcrooks@succeed.net>
Cc: netfilter@lists.samba.org

iptables <> router

It tracks connections and not which device it came from. You need iproute 2
to do something like you need.

I wonder what it would be like to have 2 default gateways and DROP packets
on each gateway depending on the source address.. wouldn't routes then try
the other link????

Say

192.168.0.1      192.168.0.2
|       eth0     |
-------------------
        FW
`add default gw 203.x.x.x`
`add default gw 210.x.x.x`
iptables -A FORWARD -s 192.168.0.1 -i eth1 -j DROP
iptables -A FORWARD -s 192.168.0.2 -i eth2 -j DROP
iptables -A POSTROUTING -s 192.168.0.1 -o eth2 -j MASQUERADE
iptables -A POSTROUTING -s 192.168.0.2 -o eth1 -j MASQUERADE
-------------------
|eth1            |eth2
203.x.x.x        210.x.x.x

Would Host Unreachable make the route try the other default gateway??? Not a
pretty sight though.....
Sorry if it's a bit messed up.. I'm about to leave work..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Dan Crooks [mailto:dcrooks@succeed.net]
Sent: Thursday, 04 July 2002 3:46 PM
To: netfilter@lists.samba.org
Subject: RE: Dual Internet Connection


>Message: 9
>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>Organization: Software Solutions
>To: <netfilter@lists.samba.org>
>Subject: Re: Dual Internet Connection
>Date: Mon, 1 Jul 2002 08:52:20 +0100
>
>On Monday 01 July 2002 12:45 am, Dan Crooks wrote:
>
>> I have two internet connections, one DSL and one Cable.  I want to run
both
>> connections to one machine using seperate NIC's.  Can I apply the same
>> rules to both interfaces?  I can't see a problem with incoming
connections
>> but not sure about the outgoing.
>>
>> I want to be able to select what connection each computer on my LAN uses
>> for it's internet connection by changing their gateway.  I'm just not
sure
>> how to implement the firewall.

>You will find this a *little* tricky using a single firewall - it would be
>easier to use two firewalls, possibly with 3 NICs each - internal,
external,
>and to the other firewall, but if you want to do it on one machine, you'll
>need to learn about iproute2 and special routing table methods for
specifying
>different external routes depending on the source address from your
internal
>machines.
>
>The netfilter rules are no problem - just specify whatever you want and
they
>will do their job - the less simple part is getting the underlying routing
on
>the machine to send the packets out where you want them to go...

The setup I have now routes all packets from the internal network to the
gateway
machine (if the packets are not destined to another machine on the lan of
course).

I then add another interface to the gateway machine and modify the firewall
to masq
outbound traffic from the lan.

I change nothing on the lan machines.  They should still access the internet
the
same as before.  I then change the gateway on one lan machine and point it
to the
new interface/gateway.

When the replies to the traffic come back, wouldn't iptables know which
interface
to route the traffic to and send it to right machine?  What am I missing
here?


