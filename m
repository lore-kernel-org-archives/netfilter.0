From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: A question about routing cache (for load balancing).
Date: Fri, 08 Nov 2013 03:23:56 +0200
Message-ID: <527C3D2C.5010502@ngtech.co.il>
References: <5278501B.4040406@ngtech.co.il> <CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com> <527BC564.1000008@ngtech.co.il> <CACuyg25xzoDS7wMyc8Ah=ZpoEvRoqbwgMMwA-vtetFFRU0Q9Wg@mail.gmail.com> <527C0E1A.6050003@ngtech.co.il> <CACuyg25VT0RF7aC9Kdi2ehwjvzP2PBjn2_o=nNpgBnBtQcJ7XQ@mail.gmail.com> <CACuyg25OkrrcSngu9MCUT3vwvQ87L7Y_HCaXvBkY80Hb2jWoqw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <CACuyg25OkrrcSngu9MCUT3vwvQ87L7Y_HCaXvBkY80Hb2jWoqw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>

On 11/08/2013 02:39 AM, Humberto Juc=E1 wrote:
> You're talking about this:
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D89aef8921bfbac22f00e04f8450f6e447db13e42
Exactly!!!

> I will need to research about it too.

The main problem with LoadBalancing based on route cache is that it's=20
not real loadbalancing but rather an exploit of the routing capabilitie=
s=20
design.

A route cache is per *route*
means all traffic from this "src ip" that travels throw "this local ip"=
=20
towards "this remote ip" will continue to be routed like this for the=20
next 300 secs..
as a route cache entry states:
# ip route get 209.169.10.131
209.169.10.131 via 192.168.10.254 dev eth0  src 192.168.10.1
     cache  mtu 1500 advmss 1460 hoplimit 64
##end

So let say I am issuing 20 connections towards the same host the exact=20
same gateway will be used as long as the garbage collection will not=20
remove the entry.
In this time the nexthop\gateway could fall down and get up about 60++=20
times..

So from what I understood from the change in the kernel is that a=20
routing system should use the FIB to calculate the right path (10Mpps i=
s=20
enough?) as expected from a dynamic routing system on the packet level=20
instead of routing the packets based on a cache and a FIB lookup in a=20
case needed(which means it can take two lookups one for the cache and=20
second using the FIB).

In a case of LoadBalancer I would assume there is a need for iptables=20
connection marking which has an option to really follow the TCP and UDP=
=20
connections and not just routing based on cache.
In any case IPTABLES based loadbalancing of TCP level (not an=20
application level) can take a bit more cycles and a bit more RAM but it=
=20
still faster then any proxy application.

But an application that monitors the LB router and the services servers=
=20
load constantly can change "static" routes to make sure that the load i=
s=20
distributed.
In this case there must be some connection tracking on the LB to make=20
sure that the TCP connections will not just break to the clients in the=
=20
middle of a connection which can lead to a "read error" for example.

How to handle these errors? I think it's another subject which I want t=
o=20
later on read more about.

Eliezer




