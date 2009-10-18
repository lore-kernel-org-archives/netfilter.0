From: Robin Wood <robin@digininja.org>
Subject: Re: transparent proxy and iptables (and ebtables) failing
Date: Sun, 18 Oct 2009 23:03:04 +0100
Message-ID: <7de411230910181503s3be59470sd2a3cddfc54d327@mail.gmail.com>
References: <7de411230910131427t26e7a84cg181329b8c32d62f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7de411230910131427t26e7a84cg181329b8c32d62f9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2009/10/13 Robin Wood <robin@digininja.org>:
> 2009/10/7 Robin Wood <robin@digininja.org>:
>> 2009/10/7 Robin Wood <robin@digininja.org>:
>>> Hi
>>> I'm trying to setup a transparent proxy so I've got a linux device
>>> with two NICs which are bridged using brctl. Traffic flows happily
>>> across the bridge so I know it is working fine.
>>>
>>> Now when I try to setup the iptables rules they are being ignored. =
The
>>> rule I want to use is:
>>>
>>> iptables -t nat -A PREROUTING -i br-lan -p tcp --dport 80 -j REDIRE=
CT
>>> --to-port 3128
>>>
>>> but nothing gets redirected. I've also tried changing 3128 to a por=
t
>>> that is closed to see what would happen, nothing, the packets kept
>>> flowing.
>>
>> Various people have suggested using ebtables rather than iptables
>> because I want to act on traffic over the bridge rather than between
>> interfaces. If this is correct, how would I rewrite the above rule i=
n
>> ebtables speak?
>
> I'm back to playing with this and I've now tried ebtables (which I
> hope is covered by this list) and I'm still not managing to trap
> traffic. The bridge is as follows
>
> # brctl show
> bridge name =A0 =A0 bridge id =A0 =A0 =A0 =A0 =A0 =A0 =A0 STP enabled=
 =A0 =A0 interfaces
> br-lan =A0 =A0 =A0 =A0 =A08000.001884d0a060 =A0 =A0 =A0 no =A0 =A0 =A0=
 =A0 =A0 =A0 =A0eth0.0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eth0.1
>
> And the two rules I've tried are
>
> # ebtables -L
> Bridge table: filter
>
> Bridge chain: INPUT, entries: 1, policy: ACCEPT
> -p IPv4 --ip-dst 192.168.0.8 -j DROP
>
> Bridge chain: FORWARD, entries: 1, policy: ACCEPT
> -p IPv4 --ip-proto tcp --ip-dport 80 -j DROP
>
> Bridge chain: OUTPUT, entries: 0, policy: ACCEPT
>
> The first I think should intercept all ipv4 traffic going to
> 192.168.0.8 and drop it, it doesn't.
>
> The second should drop all ipv4 tcp traffic on port 80. Again, this
> doesn't work.
>
> Any suggestions as to what could be happening?
>
> Robin
>

I've done some more investigating on this and moved a little further
forward. I wondered if it were the device I'm using as even though it
has two NICs they don't seem to be two distinct devices as the come up
as eth0.0 and eth0.1 with an eth0 which sees traffic on both
interfaces.

So, I added a USB NIC to give me a completely separate interface and
tried again but with the standard transparent bridge iptables line
nothing happened. So I started playing with the ebtables commands and
found a way to intercept traffic. If I run

ebtables -t broute -A BROUTING  -j DROP

All traffic on the bridge is dropped. However, when I put in the IPv4 p=
rotocol,

ebtables -t broute -A BROUTING -p IPv4  -j DROP

the traffic can flow again. I tried adding IPv6 as well, just in case
but that didn't do anything. I also tried capturing some traffic with
tcpdump and checking that it shows normal traffic when sniffing either
the bridge or individual interfaces. There doesn't seem to be any
unusual encapsulation going on.

Can anyone suggest any other debug/testing I can do?

Robin
