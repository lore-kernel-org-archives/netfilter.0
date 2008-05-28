From: Patrick McHardy <kaber@trash.net>
Subject: Re: DUAL wan issue, destination-based routing
Date: Wed, 28 May 2008 07:03:05 +0200
Message-ID: <483CE789.40806@trash.net>
References: <840713630805271644hff81960m5c6bea1b612a973c@mail.gmail.com> <840713630805271651r116edbb8y58973325c2f7fa49@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <840713630805271651r116edbb8y58973325c2f7fa49@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jeev <smallpox@gmail.com>
Cc: netfilter@vger.kernel.org

jeev wrote:
> Hey guys, i was reading on the netfilter site.
> 
> I saw Patrick McHardy wrote about having 2 cable modems... i'm in the
> same situation... my only problem is that I dont want to do load
> balancing, i've just come from using PFSENSE/freebsd to use
> ClarkConnect on CentOS i guess.. i've never used iptables before. i've
> tried things like:
> 
> "iptables -A POSTROUTING -t nat -o eth2 -s 192.168.2.0/24 -d
> 67.17.117.0/24 -j MASQUERADE" and it still doesn't work.
> 
> 192.168.2.0/24 dev eth1  proto kernel  scope link  src 192.168.2.1
> 24.x.x.0/23 dev eth2  proto kernel  scope link  src 24.x.x.23
> 71.x.x.0/23 dev eth3  proto kernel  scope link  src 71.x.x.6
> default via 71.x.x.1 dev eth3
> 
> so right now i have all traffic go out eth3, i'd love to have the ips
> and ipblocks i select and have it go out one of the cable interfaces.
> so for the example above, i want www.speedtest.net (because it shows
> the ip) to go out eth2 but it's still going out eth3.

If you only want to distribute outgoing traffic, thats quite easy:

- set up routing rules and tables for both connections:

ip rule add fwmark 0x1 lookup 100
ip route add default via ... dev <dev1> table 100

ip rule add fwmark 0x2 lookup 200
ip route add default via ... dev <dev2> table 200

- set up distribution, in this case using iptables and equal
shares:

iptables -t mangle -A PREROUTING -m connmark --mark 0x0 \
				 -m statistic --mode nth --every 2 \
				 -j CONNMARK --set-mark 0x1
iptables -t mangle -A PREROUTING -m connmark --mark 0x0 \
				 -j CONNMARK --set-mark 0x2

iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark

^ duplicate these three rules with OUTPUT instead of PREROUTING
for locally generated traffic.

You can use any criteria you like for distribution, the important
thing is to make sure connections stay on one connection when using
NAT (since many providers don't allow spoofed addresses), which is
done by checking whether the connection has already been routed
using "-m connmark --mark 0x0" before marking. You might also want
to check out the RATEEST target and match, they allow to include
the current load in the decision.

Dealing with incoming connections on both internet connections
is trickier because you need to make sure they go out the same
way they came in, so I'll skip this because I'm short on time
right now :)

