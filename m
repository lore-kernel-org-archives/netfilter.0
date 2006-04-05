From: "Randy Grimshaw" <rgrimsha@syr.edu>
Subject: Re: Throttling NAT interface
Date: Wed, 05 Apr 2006 14:11:16 -0400
Message-ID: <s433d021.098@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: casey@phantombsd.org
Cc: netfilter@lists.netfilter.org

I hope this isn't evasive, but I am still learning this stuff too.

The packets that don't match - i.e. exceed the threshold - will continue =
down the chain.
You can do a lot of different things with those packets as you need. You =
can probably match the behavior of tc if that is what you want.

<><Randy


<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu

>>> Casey Scott <casey@phantombsd.org> 4/5/2006 1:35 PM >>>
Thanks for the response. Will using iptables in that=20
manner cause the firewall to just drop the packets that=20
arrived after the limit has been reached? I don't want=20
to have to drop packets that have already used up=20
bandwidth getting to the machine, and making matters=20
worse by requiring the packets to be sent again.=20

Thanks,
Casey
----- Original Message -----
From: Randy Grimshaw <rgrimsha@syr.edu>
To: netfilter@lists.netfilter.org, casey@phantombsd.org=20
Sent: Wednesday, April 5, 2006 10:27:48 AM GMT-0800
Subject: Re: Throttling NAT interface

Our throttle is really in the other direction but the=20
idea may work for you.
iptables [traffic pattern spec] -m limit --limit=20
40/second --limit-burst 60 -j LEVEL2
LEVEL2 is a user defined chain that specifies other=20
restrictions or in your case NAT translations.=20
The point is that you can match the traffic patterns=20
that you need before applying the limit match.
hope this is helpful.
<><Randy


<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu=20

>>> Casey Scott <casey@phantombsd.org> 4/5/2006 12:44 PM >>>
The gist of what I need to do is restrict the rate of
 off-network traffic coming in through a host. The host
is providing basic NAT to an internal network. I have
gotten pretty close to what I need to do with iptables
 and tc. The problem is that when an interface is throttle
 with tc, the source of the traffic doesn't matter. I don't
 want to throttle local traffic, just traffic coming through
 the machine from a WAN. The next step was to add another
NIC to the machine. Something like this:

eth0:  <local IP1>
eth1: <WAN IP>
eth2: <local IP2>

The problem is that even if  traffic destined to be routed
off network comes into eth2, which is throttle via tc, the
return traffic comes back through eth0. Since tc (tbf filter)
just controls the transmitting of an interface, I need to
force the NAT traffic to use eth2. Traffic that is meant to
stay local can use eth0. Is possible to do something like this?
How can I this host to only eth2 for NAT even though both eth0
and eth2 are in the same network?  eth0 is not throttled, which
 is why local traffic needs to use it.

TIA,
Casey





