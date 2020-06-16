From: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Subject: Re: WiFi Hotspot Disable Neighbor discovery,Ask
Date: Tue, 16 Jun 2020 11:09:17 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2006161012410.11442@piplus.local.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hooman <netfilter@vger.kernel.org>

Hi there,

On Mon, 15 Jun 2020, Hooman wrote:

> I am using WiFi hotspot feature of Ubuntu 18.04 to create a hotspot for
> my devices. I need to prevent different devices on the network from
> contacting each other.
>
> More specifically, I have two phones on the network, I would like them
> not to be able to send any packets to each other. Right now if phone 1
> is using IP address 10.42.0.172 and phone 2 is using 10.42.0.59, I can
> use phone 1 to ping 10.42.0.59.
>
> I would like to disable connections between different hosts on the
> network created by the hotspot.
>
> I tried using iptables to drop local traffic. However, it seems like the
> iptables don't have any effect on these packets.
>
> I do see local packets on wireshark though. I'm wondering if local
> packets are forwarded directly without hitting the iptable rules.

That's _almost_ what is happening, I think.  It isn't totally clear to
me but I'm going to assume that all your devices can communicate with
your Ubuntu box over your local network.

The word 'forward' has a specific meaning in networking.  It means
that the connection goes via a router which is responsible for traffic
which crosses network boundaries, and in that case the router can do
things with the traffic (like block it, NAT and so on).  But in your
case the devices are on the SAME network; traffic doesn't need to pass
through a router, a switch or hub will do, but a switch or hub doesn't
meddle with the traffic like a router can.  I guess you have all the
devices and your Ubuntu box connected via the same Ethernet switch, in
which case the Ubuntu box won't even see the traffic between the two
other devices when they talk to each other.  If you have a hub and not
a switch the Ubuntu box will see it, but even then it won't be able to
do much about it, as the packets would not be addressed to the Ubuntu
box - they would effectively just be network noise, and ignored.

> Is it possible to use iptables or ebtables to filter these packets?

Not as things stand, you need to force the traffic through a router.
Your Ubuntu box can be the router.

> Is there any other solution to this?

To force all the traffic through your Ubuntu box you could put each of
the other hosts on a separate subnet.  For example, assuming that you
set up each subnet as a /16, for the two devices you could have:

10.43.0.2 instead of 10.42.0.59 and
10.44.0.2 instead of 10.42.0.172

You will then need to add IPs 10.43.0.1 and 10.44.0.1 to the interface
on the Ubuntu box, and also to tell the Ubuntu box to forward packets,
which can sometimes have interesting side-effects.  As root, something
like

echo 1 > /proc/sys/net/ipv4/ip_forward

or

sysctl -w net.ipv4.ip_forward=1

will do the trick for IPv4 packets.

If you _did_ want the two devices to talk to each other sometime, then
you'd need to set up routes in each device, which is normally an extra
complication when you set up subnets so that the subnets can talk to
each other.  But since you specifically don't want that to happen then
you don't need to do that normally (at least to me) irritating part.
You can then have rules on the Ubuntu box which block traffic between
the two devices.

There's nothing really special about the IP numbers I've chosen which
would mean that 10.42.0.59 and 10.42.0.172 are on the same subnet and
the 10.43 and 10.44 numbers are not.  The thing which determines that
is the network mask.  Most of the time on a 10.x.x.x network the mask
will be /8 (or 255.0.0.0) for example, and on a 192.168.x.x network it
will be /16 (or 255.255.0.0), but you could for example have a mask of
/25 (255.255.128.0), which would mean that 10.42.0.59 and 10.42.0.172
are actually on separate networks and need to be routed.  The thinking
is a bit more tricky though, so that's why I chose the numbers in my
examples.  The documentation on the Netfilter Website goes into a
great deal more detail than I can here.  It will take you some time to
wade through it but it will be worth the effort.

-- 

73,
Ged.
PS: Google rejects all my mail, and I reject all theirs.
