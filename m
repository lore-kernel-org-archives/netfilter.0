From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: A question about routing cache (for load balancing).
Date: Fri, 08 Nov 2013 00:03:06 +0200
Message-ID: <527C0E1A.6050003@ngtech.co.il>
References: <5278501B.4040406@ngtech.co.il> <CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com> <527BC564.1000008@ngtech.co.il> <CACuyg25xzoDS7wMyc8Ah=ZpoEvRoqbwgMMwA-vtetFFRU0Q9Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <CACuyg25xzoDS7wMyc8Ah=ZpoEvRoqbwgMMwA-vtetFFRU0Q9Wg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Cc: netfilter@vger.kernel.org

=46irst thanks!

It helps to understand what was changed.
(notes in the email)

On 11/07/2013 10:59 PM, Humberto Juc=E1 wrote:
> ip route get 200
> # This probe result in 10.1.1.1
>
> # wait 1s and
> ip route get 201
> # This probe result in 10.1.2.1
>
> # wait 1s and
> ip route get 202
> # This probe result 10.1.1.1

This is the part when I got confused while trying to understand the=20
"ipv4 route cache removed".
ip route show cache will show "blank".
but when I run ip route get 201 I see the result with "cache".

>
> If you increase this value, all tests can result the same gateway in
> gc_interval period.

Are you talking about "before" the cache removal or "after"?

> Each learned path will be maintained by gc_timeout.
> But this path will be*checked*  only every gc_interval.
>
> The result for 200 will be the same until gc_timeout.
> This time expire after *300s of inactivity*.
>
> ip route get 200
> ip route get 200
> ip route get 200
>
> This probe will return the same path: only 10.1.1.1

Which is not happens after 3.6 kernel and the cache removal.
try a nice example:
$ watch -d --interval=3D0.1 ip route get 200
and see what I am talking about.

OK so the next scenario:
Client: 192.168.1.1/24

Lan Router: 192.168.1.254/24
Lan Router wan side:192.168.100.254/24

Wan Router 1:192.168.100.1/24
Wan Router 1-wanip: 3.3.3.3

Wan Router 1:192.168.100.2/24
Wan Router 1-wanip: 4.4.4.4

Simple HTTP\SMTP\SSH\TCP server: 6.6.6.6

Client -> SYN --> Lan ROUTER: --> *WAN-router1*(which does NAT) --> BIG=
=20
INTERNET --> TCP server

TCP server SYN-ACK --> BIG INTERNET -> *WAN-router1*(NAT) --> Lan ROUTE=
R=20
--> Client

Client -> ACK --> Lan ROUTER: --> *WAN-router2*(which does NAT) --> BIG=
=20
INTERNET --> TCP server

OK so now stop and feel the TCP server FW:
"Hmm what is this strange packet?? I think it's an invalid packet and=20
the sentence for this one is *DROP*"
In the application level it will be almost the same:
"Hmm I do not recall any existing connection from this IP so=20
*DROP*\ignore that"

=46or a simple router that handles internet traffic simple LoadBalancer=
=20
router will not have any effect but in the case of TCP load balancing I=
=20
am almost certain that IPTABLES will need do a thing or two about that.

Am I right about the direction of how it goes?

Thank,
Eliezer

>
> But, if you change gc_timeout to 1
> echo 1 > /proc/sys/net/ipv4/route/gc_timeout
>
> ip route get 200 # wait 1 or 2s
> ip route get 200 # wait 1 or 2s
> ip route get 200 # wait 1 or 2s
>
> The result will be balanced - i consider this a aggressive load balan=
ce.
> This is not so complicated in TCP (because the protocol is
> connection-oriented), but is very much in UDP.
> I refer to the persistence of connection, not the application. You
> will certainly have problems with https and email sessions.
>
> So, a larger value for gc_timeout will allow you a greater connection
> persistence.


