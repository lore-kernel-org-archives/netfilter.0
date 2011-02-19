From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DMZ issue - redirect works as expected but behaviour not desired
Date: Sun, 20 Feb 2011 00:10:03 +0100
Message-ID: <4D604DCB.8030409@plouf.fr.eu.org>
References: <41BA18AA-DB18-493A-9429-37A188A2442B@utpress.utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <41BA18AA-DB18-493A-9429-37A188A2442B@utpress.utoronto.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

=46easey, Nicholas a =E9crit :
> I'm setting up a box that will be the only device on the Internet and
> will forward requested services to other servers sitting on a DMZ.
>=20
> As a test I started with redirecting a web server.
>=20
> To test my arrangement I first merely set up a simple masquerade (jus=
t
> on my internal network) in my iptables like so:
>=20
> *nat
> :PREROUTING ACCEPT [0:0]
> :POSTROUTING ACCEPT [0:0]
> -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to 192.168.40.15
> -A POSTROUTING -j MASQUERADE

Be aware that using MASQUERADE on all interfaces may not do what you
want. Usually, it is used only on the public internet side.

> *filter
> ...normal filtering lines follow.
>=20
> This POSTROUTING entry works as well:
>=20
> -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.40.15
>=20
> I think this is because the above line is doing the same as the short=
cut
> MASQUERADE.

Not exactly. This rule replaces the source address of any connection
going out eth0 with 192.168.40.15 whereas the above MASQUERADE rule
replaces the source address of any connection going out any interface
with the address of the interface.

By the way, it is weird that you use the address of a remote host (the
server in the DMZ).

> When I check the httpd access_log it shows that the connection came f=
rom
> 192.168.40.15 as expected.  It works.

I'm puzzled. A connection cannot match both the DNAT and SNAT rules as
they have the same input and output interface eth0. Even if it did (the
connection goes out the interface it came in), this connection would en=
d
up having the same address as source and destination 192.168.40.15.
