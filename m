From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: POSTROUTING SNAT only reply packets
Date: Mon, 17 Jan 2011 11:38:30 +0100
Message-ID: <4D341C26.2010207@freemail.hu>
References: <4D341710.60509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D341710.60509@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>, netfilter list <netfilter@vger.kernel.org>

Hi,

2011-01-17 11:16 keltez=E9ssel, GMail Isaac Gonzalez =EDrta:
> Hi,
>

> I've doing some testing and seems that iptables only do SNAT on NEW=20
> connections, and I need to change the ip address of replied packets.=20
> Anybody know some workaround? If anobody do not know some workaround=20
> can you confirm that it's not posible to do this with iptables?

read again the NAT part in the manual:
man iptables

nat table:
               nat:
                   This table is consulted when a packet that creates a=
=20
new connection is encountered.  It consists of three built-ins:=20
PREROUTING (for altering packets as soon as they come in), OUTPUT (for =
=20
altering  locally-gener-
                   ated packets before routing), and POSTROUTING (for=20
altering packets as they are about to go out).

DNAT target:

    DNAT
        This  target  is  only valid in the nat table, in the PREROUTIN=
G=20
and OUTPUT chains, and user-defined chains which are only called from=20
those chains.  It specifies that the destination address of the packet=20
should be modified
        (and all future packets in this connection will also be=20
mangled), and rules should cease being examined.  It takes one type of=20
option:

SNAT target:

    SNAT
        This target is only valid in the nat table, in the POSTROUTING=20
chain.  It specifies that the source address of the packet should be=20
modified (and all future packets in this connection will also be=20
mangled), and rules  should
        cease being examined.  It takes one type of option:


> I've tried the next ip tables rules and only work when I do NEW=20
> connections from the web server.
>
> -A POSTROUTING -o br0 -s WE_SERVER_ADDR -p tcp -m tcp --sport 80=20
> --dport 1024:65535 -j SNAT --to-source LOAD_BALANCER_ADDR
>
> Thanks in advance.
>
> Isaac Gonz=E1lez
>

You should do all of the NAT-ing ON THE LOAD BALANCER:

iptables -t nat -A PREROUTING -j DNAT -p tcp --dport 80 --to-destinatio=
n=20
WEBSERVER1 (some load balancing options here)
iptables -t nat -A PREROUTING -j DNAT -p tcp --dport 80 --to-destinatio=
n=20
WEBSERVER2 (some load balancing options here)

iptables -t nat -A POSTROUTING -j SNAT -p tcp --dport 80 -d WEBSERVER1=20
--to-source BALANCER_IP_ON_WEBSERVER1_NET
iptables -t nat -A POSTROUTING -j SNAT -p tcp --dport 80 -d WEBSERVER1=20
--to-source BALANCER_IP_ON_WEBSERVER2_NET

But some other rules may be in effect....

Swifty

