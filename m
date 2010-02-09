From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: How do you correctly interpret the FORWARD chain interface 
	options?
Date: Tue, 09 Feb 2010 17:57:52 +0200
Message-ID: <1265731072.3930.41.camel@casper.meteor.dp.ua>
References: <ac5c74141002090517o5463ed02i3b8c52b553bb462d@mail.gmail.com>
	 <56378e321002090525p44cfe5a4u3f1c89a355f78322@mail.gmail.com>
	 <ac5c74141002090723l73bd7ccva8b9e214fe33badc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ac5c74141002090723l73bd7ccva8b9e214fe33badc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org

=F7 =F7=D4=CF, 09/02/2010 =D7 15:23 +0000, paddy joesoap =D0=C9=DB=C5=D4=
:
> On Tue, Feb 9, 2010 at 1:25 PM, Richard Horton <arimus.uk@googlemail.=
com> wrote:
> > On 9 February 2010 13:17, paddy joesoap <paddyjoesoap@gmail.com> wr=
ote:
> >> Hi All,
> >>
> >> How should one interpret the inbound ("-i") and outbound ("-o") of=
 the
> >> FORWARD chain.
> >>
> >
> >
> > -i refers to the interface the packet is received on.
> > -o refers to the interface the packet is routed out on.
> >
> >
>=20
> Does this mean that both versions below are equivalent or at least do
> the same job?

Not at all.

> (1)
>=20
> iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT

This rule will match packets sent from "client" to a webServIP.

> iptables -A FORWARD -o eth1 -p tcp -s webServIP -j ACCEPT

Considering that webServIP located in network connected to eth1, this
rule will not match because packets sent out to eth1 cannot have
webServIP as source address.

> Because a packet will enter eth0 for internal network and a packet
> will leave eth1 (pushed towards eth0).
>=20
> (2)
>=20
> iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT

This rule will match packets sent from "client" to a webServIP.

> iptables -A FORWARD -o eth0 -p tcp -s webServIP -j ACCEPT

This rule will match packets sent from webServIP to "client".

> Because a packet will enter eth0 to be forwarded internally and a
> packet will also enter eth0 when leaving the network.

When packet enters and leaves one interface (eth0) it isn't actually a
routing.

Considering that webServIP located in network connected to eth1 and
clients talking to the server located in network connected to eth0 you
can use those rules:

iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp -d webServIP -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp -d webServIP -j ACCEPT

Those 3 rules will do the same job each, you can use either of them.
They will match packets sent from "clients" to "server".

iptables -A FORWARD -i eth1 -p tcp -s webServIP -j ACCEPT
iptables -A FORWARD -o eth0 -p tcp -s webServIP -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp -s webServIP -j ACCEPT

This 3 rules will do the same job each, you can use either of them. The=
y
will match packets sent from "servers" to "clients".

As you probaly already know each connection of client to server sends
packets in both direction regardless of what you are doing, downloading
or uploading.

=46or example if you want to only allow web traffic (port 80) from
"clients" for "server" you would have to use rules like this:

iptables -A FORWARD -i eth0 -o eth1 -d webServIP -p tcp --dport 80 -j
ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -s webServIP -p tcp --sport 80 -j
ACCEPT

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

