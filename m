From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: IP Forwarding works on local port but not a remote port
Date: Fri, 05 Feb 2010 20:24:56 +0200
Message-ID: <1265394296.3910.19.camel@casper.meteor.dp.ua>
References: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com>
	 <1265389890.3910.11.camel@casper.meteor.dp.ua>
	 <81ed8b881002051013n5f020a3fladfda4a5f33aa625@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <81ed8b881002051013n5f020a3fladfda4a5f33aa625@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Dan Daugherty <rescue@ddaniscool.com>
Cc: netfilter@vger.kernel.org

=F7 =F0=D4=CE, 05/02/2010 =D7 13:13 -0500, Dan Daugherty =D0=C9=DB=C5=D4=
:
> Thanks.  I tried adding the SNAT entry and it still fails the same
> way.  I need to enable logging to see where the packets are still
> being dropped.  I've never had to enable logging so I need to check
> the docs and get some results.

=46irst, check the rule counters with iptables -t nat -nvL
Then tcpdump on both 10.117.1.205 and 10.117.1.203.


> 2010/2/5 =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper=
@meteor.dp.ua>
>         =F7 =F0=D4=CE, 05/02/2010 =D7 10:47 -0500, Dan Daugherty =D0=C9=
=DB=C5=D4:
>        =20
>         > Normally I wouldn't have a problem with this but I'm doing
>         something a
>         > bit different than I would normally do.
>         > I have a RHEL5 server with one NIC that is being used as a
>         router.  My
>         > problem is that I can't seem to completely forward requests
>         off of
>         > this box using iptables.  If I specify a port redirection t=
o
>         a local
>         > port, it works fine but when I specify forwarding that port
>         to another
>         > machine, it fails.  I think the request is being sent
>         through but the
>         > response isn't making it back to me.  I can have a clean
>         iptables to
>         > start and only need to execute one command to make the loca=
l
>         forward
>         > work and since I'm not technically using the machine as a
>         gateway, I'm
>         > not sure if all the INPUT, OUTPUT and FORWARD chain command=
s
>         are
>         > necessary.
>         >
>         > 10.117.1.205 is the server in question
>         > 10.117.1.203 is the server I am trying to forward to
>         >
>         > Working command:
>         > iptables -t nat -A PREROUTING -p tcp --dport 1524 -i eth0 -=
j
>         DNAT --to
>         > 10.117.1.205:22
>         >
>         > Using telnet to test:
>         > telnet 10.117.1.205 1524
>         > Trying 10.117.1.205...
>         > Connected to -----------.
>         > Escape character is '^]'.
>         > SSH-2.0-OpenSSH_4.3
>         >
>         > Failing command:
>         > iptables -t nat -A PREROUTING -p tcp --dport 1524 -i eth0 -=
j
>         DNAT --to
>         > 10.117.1.203:1524
>         >
>         > Telnet never completes:
>         > telnet 10.117.1.205 1524
>         > Trying 10.117.1.205...
>        =20
>        =20
>         The problem here is that no actual routing is being done
>         because all
>         hosts are in the same IP net.
>        =20
>         This is what happens:
>        =20
>         1. You send request:           x.x.x.x:X         ->
>         10.117.1.205:1524
>         2. Server is doing DNAT:       x.x.x.x:X         ->
>         10.117.1.203:1524
>         3. 10.117.1.203 is responding: 10.117.1.203:1524 -> x.x.x.x:X
>         4. x.x.x.x doesn't expect packets from 10.117.1.203, because
>         it was
>         initially connecting to 10.117.1.205 and drops the packet.
>        =20
>         For this to work you should also do SNAT:
>        =20
>         iptables -t nat -A POSTROUTING -o eth0 -d 10.117.1.203 -p tcp
>         --dport
>         1524 -j SNAT --to-source 10.117.1.205
>        =20
>         This way responce packets will go back to 10.117.1.205 and
>         then to
>         sender:
>        =20
>         1. You send request:           x.x.x.x:X         ->
>         10.117.1.205:1524
>         2. Server is doing DNAT:       x.x.x.x:X         ->
>         10.117.1.203:1524
>         3. Server is doing SNAT:       10.117.1.205:X    ->
>         10.117.1.203:1524
>         4. 10.117.1.203 is responding: 10.117.1.203:1524 ->
>         10.117.1.205:X
>         5. Server is doing unSNAT:     10.117.1.203:1524 -> x.x.x.x:X
>         6. Server is doing unDNAT:     10.117.1.205:1524 -> x.x.x.x:X
>         7. x.x.x.x gets legal responce 10.117.1.205:1524 -> x.x.x.x:X
>        =20
>         --
>         =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@=
meteor.dp.ua>
>        =20
>=20
--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

