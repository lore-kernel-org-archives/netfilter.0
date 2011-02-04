From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: shaping vlans - revisited
Date: Fri, 4 Feb 2011 12:06:17 -0200
Message-ID: <20110204120617.58a2ef27@pulsar.inexo.com.br>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
	<20110203180118.62970fb1@pulsar.inexo.com.br>
	<4D4B75C3.2060007@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4B75C3.2060007@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, 03 Feb 2011 21:42:59 -0600
Grant Taylor <gtaylor@riverviewtech.net> wrote:

> On 2/3/2011 2:01 PM, Ethy H. Brito wrote: =20
> > One extra detail is: this setup was working (just as it is for eth0=
)
> > until two weeks ago when then we created the vlans and splited the
> > traffic among them. =20
>=20
> Once the traffic is in side of a VLAN tag (on the raw device), filter=
s=20
> will not match the traffic the say way that it did.  -  Try applying=20
> your filters to the VLAN sub-interface. =20

you mean:=20

tc filter add dev vlanA ... match mark client1
tc filter add dev vlanB ... match mark client1
tc filter add dev vlanC ... match mark client1
=2E..
=20
for each client?!?!?! the will be hundreds!!

Doesn=C2=B4t it imply having "tc {class,qdisc} add dev vlan[A-Z]" or "=20
tc {class,qdisc} add dev eth1" will do?

>=20
> This is because the traffic is no longer IP traffic in side of Ethern=
et=20
> SNAP frames, but rather VLAN tagged frames that contain Ethernet SNAP=
=20
> frames.
>=20
> Are you wanting to give one VLAN on a given raw interface more priori=
ty=20
> than another? =20

Nope. The vlans are to other ISPs. Each ISP demands 2 Vlans (IPv4+IPv6)=
=2E
I need to shape global traffic from/to each client no matter which ISP
he/she is using.

Ethy
