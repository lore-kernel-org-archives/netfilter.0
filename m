From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: POSTROUTING, ROUTING, & Traffic Control
Date: 17 Feb 2003 10:51:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045471880.18829.14.camel@rayw.knowledgefactory.co.za>
References: <PPENJEBLIPFFNCAMFNJKEEAJCIAA.jqcordova@yahoo.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-omVutDDofe2bKHl4Dho+"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <PPENJEBLIPFFNCAMFNJKEEAJCIAA.jqcordova@yahoo.com>
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


--=-omVutDDofe2bKHl4Dho+
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-02-17 at 07:06, Jeff Cordova wrote:
> I have 2 machines (A & B) behind a Linux Firewall (FW).
> I have 2 ethernet cards on the FW - eth0 talks to the internet, eth1 talk=
s
> to machines A & B.
> Machine A has lots of inbound & outbound traffic while machine B doesn't.
> It seems reasonable that I could add 2 new ethernet cards (eth2 & eth3) t=
o
> the FW and by configuring iptables and/or routing tables force traffic on=
 A
> to be handled by eth0/eth1 and traffic for B to be handled by eth2/eth3.
>=20
> Can I do this? If possible, please give explicit details.
>=20
Yes, as with anything - there is more than one way to skin a cat ...

Have a look at the lartc project. and the netfilter patch-o-matic stuff.

One possible solution is to setup traffic control rules.
Another one is to use POM to enable iptables to add interface
redirection (I don't remember what it's called in POM, but I did see it
there.)

Ray

> Thankyou,
>=20
> Jeff Cordova

--=-omVutDDofe2bKHl4Dho+
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+UKKIh1fuR/Bv+ygRAlNiAKCTlfdKHN2y6cVtierzc3w1MRpMtgCeNJPz
kTmZvPkEeqsq6rk7I0ff2gU=
=9r/e
-----END PGP SIGNATURE-----

--=-omVutDDofe2bKHl4Dho+--


