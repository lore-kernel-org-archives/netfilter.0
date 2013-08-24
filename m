From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: only allow packets match interface ip
Date: Sat, 24 Aug 2013 12:02:17 +0200
Message-ID: <521884A9.4010409@plouf.fr.eu.org>
References: <CAC6SzHKo-F_aTnjMS_MvMivict2DJh3hKiwojR4ePzj+6ECCdw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAC6SzHKo-F_aTnjMS_MvMivict2DJh3hKiwojR4ePzj+6ECCdw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: d tbsky <tbskyd@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

d tbsky a =E9crit :
>    I have multiple wan port and multiple routing table in a box.
>    the wan port should be the final destination of outside word.
> (eg: all the packets come from internet should have destination ip
> address of my wan port, there are no further routing beyond the wan i=
p
> address).
>=20
>    rp_filter seems not work correctly under multiple routing table
> situation.so I need to set rp_filter to 0.

Indeed, this is a known problem. However, if all the WAN interfaces are
connected to the internet I see no point in using rp_filter on them.

>    I want to know if there are simple setup method to secure the wan
> port ?

What do you mean exactly by "secure the wan port" ?

>  or I need to use iptables to drop the incoming packet not
> matching  the wan interface ip?

You are talking about two different things. rp_filter checks the source
address in incoming packets, not the destination address. Besides,
receiving on an interface packets which are destined to the address of
another interface is rather unlikely.

>   the problem is I have dynamic ppp interface, so matching the ip via
> iptables is a little complicated.

You can use scripts in /etc/ppp/ip-{up|down}.d to add|remove iptables
rules based on the local address and interface name passed by pppd when
a PPP link is established|terminated.
Simple example :

#!/bin/sh
# /etc/ppp/ip-up.d/addrules

# Environment variables :
#    Variable     Name                          Example
#    PPP_IFACE    Interface name                ppp0
#    PPP_TTY      The tty                       ttyS1
#    PPP_SPEED    The link speed                38400
#    PPP_LOCAL    Local IP number               12.34.56.78
#    PPP_REMOTE   Peer  IP number               12.34.56.99
#    PPP_IPPARAM  Optional "ipparam" value      foo

iptables -I INPUT -i $PPP_IFACE ! -d $PPP_LOCAL -j DROP


#!/bin/sh
# /etc/ppp/ip-up.d/delrules

# Environment variables :
#    Variable     Name                          Example
#    PPP_IFACE    Interface name                ppp0
#    PPP_TTY      The tty                       ttyS1
#    PPP_SPEED    The link speed                38400
#    PPP_LOCAL    Local IP number               12.34.56.78
#    PPP_REMOTE   Peer  IP number               12.34.56.99
#    PPP_IPPARAM  Optional "ipparam" value      foo

iptables -D INPUT -i $PPP_IFACE ! -d $PPP_LOCAL -j DROP
