From: Ludovico Cavedon <cavedon@cs.ucsb.edu>
Subject: Re: invoking nat POSTROUTING *after* bridging decision
Date: Wed, 26 Jan 2011 14:07:25 -0800
Message-ID: <4D409B1D.3070303@cs.ucsb.edu>
References: <4D4071E8.2010908@cs.ucsb.edu> <4D407D65.9090902@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D407D65.9090902@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>

On 01/26/2011 12:00 PM, G=E1sp=E1r Lajos wrote:
>> Is there any way to postpone the call to POSTROUTING after the bridg=
ing
>> decision has been been, or have the POSTROUTING chain called twice?
> I don't think it is possible...
> But could you please explain us why do you want such NATing?
> Maybe we can help you out with an other setup...

Sure, thank you for asking, here it is:

Host: myfw
br0: 10.10.10.2/24
	eth0: connected to 10.10.10.1, acting as gateway to the Internet
	eth1: connected to the rest of the 10.10.10.0/24 network

hosts in the 10.10.10.0/24 network are configured with 10.10.10.1 as
default gateway. I am using the host myfw to act as transparent firewal=
l
for the 10.10.10.0/24 network (which in reality is a publicly routable
network).

I cannot change the configuration of the hosts in the 10.10.10.0/24 net=
work.

So far so good.

Then, always on the myfw machine, I have:
-eth2: 192.168.1.1, connected to the 192.168.1.0/24 network

myfw is acting as gateway for the 192.168.1.0/24 network.

More in detail, myfw should:
-route traffic between 192.168.1.0/24 and 10.10.10.0/24 (eth1)
-masquerade traffic from 192.168.1.0./24 towards the outside via
10.10.10.1 (eth0)

I managed to get this configuration working with the following iptables
and ebtables rules:

# intercept packets for the private network
ebtables -t nat -A PREROUTING -i 10.10.10.0/24 -p ipv4 --ip-destination
192.168.1.0./24 -j redirect --redirect-target ACCEPT

# SNAT packets directed to the outside world
iptables -t nat -A POSTROUTING -s 192.168.1.0./24 -o br0 ! -d
10.10.10.0/24 -j SNAT --to-source 10.10.10.2


As I said, this is working, but when I run tcpdump on br0, for
connections originating from the private network, I see outgoing packet=
s
with source IP address masqueraded (10.10.10.2), but incoming packets
already un-masqueraded (i.e. the actual address in the private network)=
=2E
This complicates running monitoring tools like ntop, other than being
oddly asymmetric.

I hope I included all relevant information.
Thanks for any suggestion about this!

Cheers,
Ludovico
