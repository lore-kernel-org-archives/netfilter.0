From: rverduij@dds.nl
Subject: Re: simple newbie question
Date: Sun, 10 Aug 2003 13:53:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060516426.3f36324a87d76@webmail.dds.nl>
References: <000101c35ebe$9504e8f0$0401a8c0@pc2>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c35ebe$9504e8f0$0401a8c0@pc2>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Mario =?iso-8859-1?b?TWVy7W5nb2xv?= <mmeringolo@arnet.com.ar>
Cc: netfilter@lists.netfilter.org

Hi there,

I used to have adsl I got cable now.

You need to set up a firewall configuration on your ppp0 interface.
(asuming ppp0 is the interface you tunnel through)

Because if you blok on your eth1 and/or eth0 all the traffic still get's=20
through to you machine, unless you have issued global rules which blok all =

interfaces.

On your eth1 card you could set up filtering rules if you don't thrust netw=
ork=20
the eth1 network card is connected to.

If you do remember to allow the traffice that builds the vpn (your pppoe=20
tunneling).
And if you use a dynamic ip on your eth1 device to allow dhcp traffic as we=
l.

I'm currently not at my own pc, but I'll post anexample tomorrow for you.

Regards
Rob


Citeren Mario Mer=EDngolo <mmeringolo@arnet.com.ar>:

> Im starting with this iptables stuff and trying to manage a home network
> trough linux and adsl + pppoe=20
>=20
> I have two simple questions.
>=20
> =20
>=20
> I have my adsl router conected to my eth1
>=20
> =20
>=20
> When im setting my iptables rules, should I think that eth0 routes packag=
es
> through eth1 to ppp0 ?
>=20
> =20
>=20
> Because, if that is, my drop rules should be defined on eth1, and my input
> ones on eth0
>=20
> =20
>=20
> Our should i think that eth1 does not matter and my reliable is eth0 and =
my
> unreliable ppp0 ?
>=20
> =20
>=20
> Please forgive my crude english
>=20
> =20
>=20
> Thanx=20
>=20
> =20
>=20
> =20
>=20
>=20




