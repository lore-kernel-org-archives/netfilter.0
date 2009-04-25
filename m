From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Should "Transparent web-caching" work with ppp0/pptp? (It   
 doesn't...)
Date: Sat, 25 Apr 2009 17:47:04 +0200
Message-ID: <49F33078.3000406@plouf.fr.eu.org>
References: <d17c5b140904250034x4b73cd8dsf91846eb5f9dda32@mail.gmail.com>	 <49F2D789.6090301@plouf.fr.eu.org>	 <d17c5b140904250631h4278233dh8989758b38ea2831@mail.gmail.com>	 <49F32073.9040207@plouf.fr.eu.org> <d17c5b140904250811j401614bbje53cce5aedb14fa7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d17c5b140904250811j401614bbje53cce5aedb14fa7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Aleksey Tsalolikhin a =E9crit :
>=20
> [root@vulture ~]#  telnet -b 192.168.2.131 www.google.com 80
> telnet: invalid option -- b

Well, the telnet client in RedHat does not seem to support this option=20
while the one in Debian does. You may try nc (netcat) instead.

$ nc -v -s 192.168.2.133 www.google.com 80

Note that from your tcpdump trace ppp0's address seem to be varying. Us=
e=20
the current one.

> I've tried running tcpdump on the web server as well, and I don't see
> ANY packets coming in from the VPN server when I run "telnet website
> 80" on the pptp client... (the CentOS box).
>=20
> Could I be running into 1a?

I'm afraid so.

> If I don't use iptables, and just set up a static route for that web
> site via the PPTP server, and telnet to website 80, it works!!
[...]
> So why does it work with static route and doesn't work with the alt
> routing table  trick?  The only difference I can see is, in the stati=
c
> route case, the packets are a little bit smaller.

The difference is the source address, as explained in my previous posts=
=2E

> Any ideas?

Yes, one :

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
