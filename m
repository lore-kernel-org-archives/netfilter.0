From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: SNAT help
Date: 09 Apr 2003 18:25:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049905548.14655.130.camel@raylinux.internal>
References: <Pine.LNX.4.44.0304091046430.19561-100000@eccweb1.edina.k12.mn.us>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-pwyGUuUa4HWQu9AGaguN"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304091046430.19561-100000@eccweb1.edina.k12.mn.us>
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


--=-pwyGUuUa4HWQu9AGaguN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Where did you put that rule? Does it come before your other SNAT rules?

Are you running a transparent web cache (like squid)?

Ray

On Wed, 2003-04-09 at 17:47, Scott Johnson wrote:
> I apologize if this message appears twice... I got a bounce on it the=20
> first time.
>=20
> I'm new to iptables so I very much appreciate any help I can get.
>=20
> I've been digging through information for about 1.5 weeks now and got mos=
t=20
> things to work, however I'm stumped on one thing...
>=20
> I've got masquerading going on for the 3000+ work stations I have in=20
> house.  In addition, I've got some good basic firewalling going on, I'm=20
> still working on the rules, but I'm happy they're working as well as they=
=20
> are.
>=20
> Now, I've got a few PC's that need a different public IP address from the=
=20
> masses.  So I'm trying to assign a static NAT to these.  When I assign th=
e=20
> static nat rule, it never gets used.
>=20
> For example:
>=20
> eth0 - internal
> eth1 - dmz
> eth2 - external
>=20
> iptables -t nat -A POSTROUTING -s 10.1.3.35/32 -o eth2 -j SNAT --to=20
> 1.2.3.4
> (where 1.2.3.4 is the public address that I'm assigning)
> ip address add 1.2.3.4 dev eth2
>=20
> creates a rule that looks like:
>=20
>    0     0 SNAT       all  --  *      eth2    10.1.3.35           =20
> 0.0.0.0/0          to:1.2.3.4
>=20
> When I go check my ip address at an external site, I keep getting the=20
> public interface IP address.
>=20
> Again, any and all help is MUCH appreciated.
>=20
> Thanks!
>   Scott=20
>=20


--=-pwyGUuUa4HWQu9AGaguN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+lEmMh1fuR/Bv+ygRAtAoAJ0Sts6Ewty+uk3GFxWGAyEErc3WSgCgnP/K
KoPjiUVyAS2Xngm2dP2gCrA=
=qAts
-----END PGP SIGNATURE-----

--=-pwyGUuUa4HWQu9AGaguN--


