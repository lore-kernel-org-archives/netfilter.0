From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: DUAL wan issue, destination-based routing
Date: Wed, 28 May 2008 13:50:40 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805281350010.1470@fbirervta.pbzchgretzou.qr>
References: <840713630805271644hff81960m5c6bea1b612a973c@mail.gmail.com> <840713630805271651r116edbb8y58973325c2f7fa49@mail.gmail.com> <483CE789.40806@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <483CE789.40806@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: jeev <smallpox@gmail.com>, netfilter@vger.kernel.org


On Wednesday 2008-05-28 07:03, Patrick McHardy wrote:

> jeev wrote:
>> Hey guys, i was reading on the netfilter site.
>> 
>> I saw Patrick McHardy wrote about having 2 cable modems... i'm in the
>> same situation... my only problem is that I dont want to do load
>> balancing, i've just come from using PFSENSE/freebsd to use
>> ClarkConnect on CentOS i guess.. i've never used iptables before. i've
>> tried things like:
>> 
>> "iptables -A POSTROUTING -t nat -o eth2 -s 192.168.2.0/24 -d
>> 67.17.117.0/24 -j MASQUERADE" and it still doesn't work.
>> 
>> 192.168.2.0/24 dev eth1  proto kernel  scope link  src 192.168.2.1
>> 24.x.x.0/23 dev eth2  proto kernel  scope link  src 24.x.x.23
>> 71.x.x.0/23 dev eth3  proto kernel  scope link  src 71.x.x.6
>> default via 71.x.x.1 dev eth3
>> 
>> so right now i have all traffic go out eth3, i'd love to have the ips
>> and ipblocks i select and have it go out one of the cable interfaces.
>> so for the example above, i want www.speedtest.net (because it shows
>> the ip) to go out eth2 but it's still going out eth3.
>
>[...]
> You can use any criteria you like for distribution, the important
> thing is to make sure connections stay on one connection when using
> NAT (since many providers don't allow spoofed addresses), [...]
> Dealing with incoming connections on both internet connections
> is trickier because you need to make sure they go out the same
> way they came in, so I'll skip this because I'm short on time
> right now :)

As described in http://dev.medozas.de/NF-Cookbook.txt.

