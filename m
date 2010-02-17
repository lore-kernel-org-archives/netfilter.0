From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Transparent http filtering VLAN traffic without being a member
 of  tagged VLANs
Date: Wed, 17 Feb 2010 21:55:18 +0100
Message-ID: <20100217215518.2944595e@catlap>
References: <c4ada2161002171216v202474a0obd2ca5c1f22511f1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c4ada2161002171216v202474a0obd2ca5c1f22511f1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Try to solve each of the problems at a time. One question - does squid
have internet connection on nonbridged interface with dedicated
IP address?

>On a bridge setup, I want to filter http traffic transparently through
>Squid. br0 bridge is between eth0 and eth1.
>In the bridged traffic there are some tagged VLANs.
>When I run tcpdump on br0 I see all the traffic from VLANs. At this
>point a DNAT (VLAN10Subnet - Any - http => Original - LocalIP -
>8080) does not work.

What does `cat /proc/sys/net/bridge/bridge-nf-filter-vlan-tagged` show?
It should be set to 1 if you want tagged traffic to pass iptables. You
can set this value in runtime by issuing:
echo 1 > /proc/sys/net/bridge/bridge-nf-filter-vlan-tagged
or more permamently by adding
net.bridge.bridge-nf-filter-vlan-tagged=1 to /etc/sysctl.conf

Anyway you still need to have the route to client as I wrote below.

>I think the problem is not having any IP on br0.26 from VLAN10Subnet.
>Because the whole C class is divided into subnets of 255.252 having 2
>usable IP address and both are used. Do you have any other idea on
>identifiying the problem?

One thing is missing for sure. Lets assume you have 10.0.0.0/30 subnet
on vlan 26. You should add on your bridge such route:
ip route add 10.0.0.0/30 dev br0.26

This way bridge knows where to send replies to clients (subnet
10.0.0.0/30 available directly on br0.26 interface).

Hope that helps.

Best regards,
Marek Kierdelewicz
