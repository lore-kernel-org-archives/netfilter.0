From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Understanding the Forward and Postrouting chain
Date: 15 Apr 2003 12:05:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050401128.1440.37.camel@raylinux.internal>
References: <PFEDLCHOEGFHBPOGGFGBGEMCCAAA.Chris@globetechsolutions.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-t9GYlwjdkCFac26z9oN2"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <PFEDLCHOEGFHBPOGGFGBGEMCCAAA.Chris@globetechsolutions.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-t9GYlwjdkCFac26z9oN2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-04-15 at 11:52, Chris Partsenidis wrote:
> Greetings everyone,
>=20
> While building a complex set a rules for my firewall I have stumbbled
> accross a few problems and would like to know if there is anyone to
> help me clear a few things in my mind.
>=20
> If I was to set the Forward chain default policy to DROP, what rules
> would I be required to enter in order to allow e.g my internal network
> hosts to telnet anywhere on the internet ?
>=20
> For example take this setup:
>=20
> LAN -----------------FIREWALL------------------------ Internet
> 192.168.1.0/24           public ip: 200.0.0.1
>                                =20
> In this simple setup, my guess is that Im required to create 3 rules
> for the telnet to work.
> One for the packets travelling from the Lan to the firewall, one for
> the oppisite (internet to the firewall) and then one more
>=20
> for the postrouting chain to masquerade the packets. Here is what I've
> done:
>=20
> 1) iptables -P FORWARD DROP
> 2) iptables -A FORWARD -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23 -j
> ACCEPT
> 3) iptables -A FORWARD -p tcp -s 0/0 --sport 23 -d  200.0.0.1 -j
> ACCEPT

This one should be:
iptables -A FORWARD -p tcp -s 0/0 --sport 23 -d  192.168.1.0/24 -j
ACCEPT
because the traffic is going back to the client not the firewall.

> 4) iptables -A POSTROUTING -t nat -s 192.168.1.0/24 -p tcp -d 0/0
> --dport 23 -j MASQUERADE
>=20
> Would this be correct, and if not, can you please explain why. I'm not
> to sure if loading ip_conntrack would eliminate the need for rule no.
> 3.
No, conntrack is connection tracking for NAT. Without conntrack you
would have many more rules to tell iptables how to track the NATed
traffic.


>=20
> Regards,=20
>=20
> Chris Partsenidis

--=-t9GYlwjdkCFac26z9oN2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+m9lnh1fuR/Bv+ygRAtosAKC2QffXEcRP2fXMi6h1xw/UxVF1pQCgpkYe
MslsAZDuz1Ap5amZ9pFkKdE=
=mfpY
-----END PGP SIGNATURE-----

--=-t9GYlwjdkCFac26z9oN2--


