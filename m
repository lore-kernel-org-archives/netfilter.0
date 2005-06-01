From: Udo Rader <udo.rader@bestsolution.at>
Subject: Re: mysterious dropped echo replies
Date: Wed, 01 Jun 2005 09:50:38 +0200
Message-ID: <1117612238.27138.17.camel@athene.bestsolution.at>
References: <1117528956.25434.65.camel@athene.bestsolution.at>
	<opsrozalyc76nf2y@xonix> <opsrozlyy176nf2y@xonix>
	<1117539228.25434.82.camel@athene.bestsolution.at>
	<opsro6aifo76nf2y@xonix> <20050601022233.GA6992@bender.817west.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-PrB4RsgxLGc718hXEaCH"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050601022233.GA6992@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--=-PrB4RsgxLGc718hXEaCH
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hmm, the packages were obviously RETURNed by the line mentioned to the
global root "catch all" rule and thats exactly what should normally
happen.

In the end I neither want the packages to be dropped nor rejected but
returned instead for the inspection by other chains, but I will only
switch back to RETURN after if I've found the origin for the echo
replies.

So for now, I am quite happy with both DROP and REJECT, thanks :-)

Udo Rader

BestSolution.at GmbH
http://www.bestsolution.at

On Tue, 2005-05-31 at 22:22 -0400, Jason Opperisano wrote:
> On Wed, Jun 01, 2005 at 06:21:44PM +0300, Sertys wrote:
> > Well , this line :
> > iptables -t nat -A Cid3D99741E.0   -d 192.168.100.0/24 -j RETURN
> >=20
> > change it to -j DROP and it wont generate any replies. -j RETURN, retur=
ns =20
> > the packet and sends and icmp message to the src!
>=20
> RETURN returns the packet to the calling chain, or enforces the
> root chain's POLICY if there is no calling chain to return to.
> your description matches what REJECT does, not RETURN.
>=20
> -j
>=20
> --
> "Stewie: Damn the toilet. It's made slaves of you all. It just
>  sits there consuming other people's feces while contributing nothing
>  of its own to society."
>         --Family Guy
--=20
B e s t S o l u t i o n . a t                        EDV Systemhaus GmbH
------------------------------------------------------------------------
udo rader              technischer leiter/CEM   mobile  ++43 660 5263642
------------------------------------------------------------------------
eduard-bodem-gasse 8/3    A-6020 innsbruck      fax      ++43 512 935833
http://www.bestsolution.at                      phone    ++43 512 935834

--=-PrB4RsgxLGc718hXEaCH
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCnWjO6VGCgP95rKIRAvFFAKCm5STDD0xg9jwo9ggPCG1u+RldHgCePcDd
oEB8QmOPyUO+0i6KyrSVaBs=
=nW9W
-----END PGP SIGNATURE-----

--=-PrB4RsgxLGc718hXEaCH--


