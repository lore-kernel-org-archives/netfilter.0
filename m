From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: RE: help iptables queuing
Date: 18 Jun 2003 14:33:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055939637.1868.63.camel@raylinux.internal>
References: <20030618114651.60897.qmail@mail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-r48RE63jBpX/gFP6VCUg"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030618114651.60897.qmail@mail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: IPtables <netfilter@lists.netfilter.org>


--=-r48RE63jBpX/gFP6VCUg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-06-18 at 13:46, Paridhi Bansal wrote:
> HI!!
>=20
> When i give
> iptables -I INPUT 1 -j MRTG, i get the following error:
>=20
> iptables v1.2.5: Couldn't load target `MRTG':/lib/iptables/libipt_MRTG.so=
: cannot open shared object file: No such file or directory
>=20
> how to rectify this??
You need to install the MRTG P-O-M patch and recompile and install the
iptables userspace programs and libraries.

>=20
> and yes, ichecked ip_conntrack is installed on my m/c..
>=20
> Paridhi
>=20
>=20
> ----- Original Message -----
> From: "George Vieira" <georgev@citadelcomputer.com.au>
> Date: Wed, 18 Jun 2003 21:36:23 +1000=20
> To: "Paridhi Bansal" <paridhibansal@mail.com>, "IPtables" <netfilter@list=
s.netfilter.org>
> Subject: RE: help iptables queuing
>=20
> > embeded
> >=20
> > -----Original Message-----
> > From: netfilter-admin@lists.netfilter.org
> > [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Paridhi Bansal
> > Sent: Wednesday, June 18, 2003 8:49 PM
> > To: IPtables
> > Subject: Re: help iptables queuing
> >=20
> >=20
> > hi
> >=20
> > >how do i check that whether conn tracking module is installed or not??
> > do a `lsmod` and check the list
> >=20
> > Actually, this problem was not coming earlier..suddenly has it statred
> > coming..now what is really puzzling me is that when i also queue packet=
s
> > from FORWARD chain(i did this just to check in case pkts were being dir=
ectly
> > sent to this chain instead of prerouting), i receive all the packets th=
rough
> > prerouting, forward and postrouting chains..and when i change the FORWA=
RD
> > back to ACCEPT all without queuing, again,the same problem..i receive o=
nly
> > the first pktof every TCP session in prerouting and postrouting chains.=
...
> > > Don't know what exactly the problem is but I use MRTG with Iptables s=
o I
> > can graph all traffic based on rules in the -N MRTG space... and it all
> > works fine for me.
> > I use `-I INPUT 1 -j MRTG` , `-I FORWARD 1 -j MRTG` , `-I OUTPUT 1 -j M=
RTG`
> > and that grabs everything.
> >=20
> > So I don't know why yours doesn't....
> >=20
> >=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-r48RE63jBpX/gFP6VCUg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+8Fw1h1fuR/Bv+ygRAmBxAKCyvGDuHb6yD1qyRDQXRDsARsqxrgCffTYS
mpbO/xOOJvPJ2ofsRGW7EIc=
=i9od
-----END PGP SIGNATURE-----

--=-r48RE63jBpX/gFP6VCUg--


