From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: A question about routing cache (for load balancing).
Date: Thu, 7 Nov 2013 23:35:18 -0300
Message-ID: <CACuyg26QgOt4m1_LD5odvy9EjmcxPxzReV0krSpVyc2ERqCnwA@mail.gmail.com>
References: <5278501B.4040406@ngtech.co.il>
	<CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com>
	<527BC564.1000008@ngtech.co.il>
	<CACuyg25xzoDS7wMyc8Ah=ZpoEvRoqbwgMMwA-vtetFFRU0Q9Wg@mail.gmail.com>
	<527C0E1A.6050003@ngtech.co.il>
	<CACuyg25VT0RF7aC9Kdi2ehwjvzP2PBjn2_o=nNpgBnBtQcJ7XQ@mail.gmail.com>
	<CACuyg25OkrrcSngu9MCUT3vwvQ87L7Y_HCaXvBkY80Hb2jWoqw@mail.gmail.com>
	<527C3D2C.5010502@ngtech.co.il>
	<CACuyg25r0sH00BOkhYaNiQccjh4o3pi4XoRt=5iPv8TWqEnSzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=y5fiVPRZvUereMb/OzSbpgxWv3TqbGcX8GQ48V0XI/s=;
        b=eplJNHkpRGr/ymEgJGcQYiEC33H8hw48Hl9S/j1F1mqbk+j2xa2qW0WzPR7G6cF+Mq
         ywYOgLXvuU+nQJZq+Og3sIHlyRptkem4rrWYUKB8ORjVS2NScYUM1zC+qTipK0arUBjP
         MRyUYL9AwqVknxGwtM6WqnC5RWbHb8PEnmHsggIrfx3dS+xz9+yQpYxfASP99GqDLRvG
         fY5w+hnsMWS1D536IlN1yEKu8ZgsCx7FWZ6NLgtKUK6diiu4vH/9irU+rbcx5cvydswg
         w5wlSSS5TxKu/Bgw1qA2bQqih6IBlgoIIXDqbIp9zM3HnQ0pDOgdRFOKmGgu5c7+r10I
         XflA==
In-Reply-To: <CACuyg25r0sH00BOkhYaNiQccjh4o3pi4XoRt=5iPv8TWqEnSzQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org

# Remove the mark inversion
iptables -t mangle -I PREROUTING -i eth1 -m mark --mark 0x0 -j
CONNMARK --restore-mark

2013/11/7 Humberto Juc=E1 <betolj@gmail.com>:
> I think I'll miss some scripts! rs
> I dont belive in this!
>
>
> Not tested, but might work:
>
> Client: 192.168.1.1/24
>
> Lan Router: 192.168.1.254/24
> Lan Router wan side:192.168.100.254/24
>
> Wan IF: eth1
>
> Wan Router 1:192.168.100.1/24
> Wan Router 1-wanip: 3.3.3.3
>
> Wan Router 2:192.168.100.2/24
> Wan Router 2-wanip: 4.4.4.4
>
>
> Probably I would use VLAN (mark in vlan interface).
> But I think you can resolve with realms (I do not know if it works).
>
> ip route flush table 100
> ip route add throw 10.0.0.0/8 table 100 realm 100
> ip route add throw 192.168.1.0/24 realm 100
> ip route add default via 192.168.100.1 realm 100
>
> ip route flush table 101
> ip route add throw 10.0.0.0/8 table 100 realm 101
> ip route add throw 192.168.1.0/24 realm 101
> ip route add default via 192.168.100.2 realm 101
>
> ip route flush table 200
> ip route add default \
>     nexthop via 192.168.100.1 realm 100 \
>     nexthop via 192.168.100.2 realm 101
>
> ip rule add prio 10 table main
> ip rule add prio 20 from 192.168.100.1 table 100
> ip rule add prio 21 from 192.168.100.2 table 101
> ip rule add prio 22 fwmark 0x100 table 100
> ip rule add prio 23 fwmark 0x101 table 101
> ip rule add prio 50 table 200
>
> ip route del default
>
> iptables -t mangle -A POSTROUTING -o eth1 -m realm --realm 100 -j
> CONNMARK --set-mark 0x100
> iptables -t mangle -A POSTROUTING -o eth1 -m realm --realm 101 -j
> CONNMARK --set-mark 0x101
>
> iptables -t mangle -A POSTROUTING -o eth1 -j CONNMARK --save-mark
>
> iptables -t mangle -I PREROUTING -i eth1 -m mark ! --mark 0x0 -j
> CONNMARK --restore-mark
>
> 2013/11/7 Eliezer Croitoru <eliezer@ngtech.co.il>:
>> On 11/08/2013 02:39 AM, Humberto Juc=E1 wrote:
>>>
>>> You're talking about this:
>>>
>>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D89aef8921bfbac22f00e04f8450f6e447db13e42
>>
>> Exactly!!!
>>
>>
>>> I will need to research about it too.
>>
>>
>> The main problem with LoadBalancing based on route cache is that it'=
s not
>> real loadbalancing but rather an exploit of the routing capabilities=
 design.
>>
>> A route cache is per *route*
>> means all traffic from this "src ip" that travels throw "this local =
ip"
>> towards "this remote ip" will continue to be routed like this for th=
e next
>> 300 secs..
>> as a route cache entry states:
>> # ip route get 209.169.10.131
>> 209.169.10.131 via 192.168.10.254 dev eth0  src 192.168.10.1
>>     cache  mtu 1500 advmss 1460 hoplimit 64
>> ##end
>>
>> So let say I am issuing 20 connections towards the same host the exa=
ct same
>> gateway will be used as long as the garbage collection will not remo=
ve the
>> entry.
>> In this time the nexthop\gateway could fall down and get up about 60=
++
>> times..
>>
>> So from what I understood from the change in the kernel is that a ro=
uting
>> system should use the FIB to calculate the right path (10Mpps is eno=
ugh?) as
>> expected from a dynamic routing system on the packet level instead o=
f
>> routing the packets based on a cache and a FIB lookup in a case need=
ed(which
>> means it can take two lookups one for the cache and second using the=
 FIB).
>>
>> In a case of LoadBalancer I would assume there is a need for iptable=
s
>> connection marking which has an option to really follow the TCP and =
UDP
>> connections and not just routing based on cache.
>> In any case IPTABLES based loadbalancing of TCP level (not an applic=
ation
>> level) can take a bit more cycles and a bit more RAM but it still fa=
ster
>> then any proxy application.
>>
>> But an application that monitors the LB router and the services serv=
ers load
>> constantly can change "static" routes to make sure that the load is
>> distributed.
>> In this case there must be some connection tracking on the LB to mak=
e sure
>> that the TCP connections will not just break to the clients in the m=
iddle of
>> a connection which can lead to a "read error" for example.
>>
>> How to handle these errors? I think it's another subject which I wan=
t to
>> later on read more about.
>>
>> Eliezer
>>
>>
>>
>>
