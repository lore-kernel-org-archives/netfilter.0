From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Conntrack full, but not really
Date: Thu, 25 Mar 2004 07:17:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080191858.12362.80.camel@raylinux.internal>
References: <4061FA01.4050604@drzeus.cx>
	 <1080169030.8520.122.camel@smoogen2.lanl.gov>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-yRGxDlEqL3idBNpVKJ6C"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1080169030.8520.122.camel@smoogen2.lanl.gov>
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


--=-yRGxDlEqL3idBNpVKJ6C
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-03-25 at 00:57, Stephen Smoogen wrote:
> On Wed, 2004-03-24 at 14:13, Pierre Ossman wrote:
> > Hi!
> >=20
> > I'm having the standard problem of the connection tracker running out o=
f=20
> > space, but this time with a twist. If I check how many connections it i=
s=20
> > currently tracking it is nowhere near the upper limit. I've searched=20
> > through the archives and haven't found anything like this.
> >=20
> > The machine is a P-2 333 MHz with 96 MB of RAM doing nothing but=20
> > routing. It's running Red Hat 9 with kernel 2.4.20-28.9 (although the=20
> > problem exists with other Red Hat kernels). The problem appears after=20
> > about a month of uptime. After that the machine needs to be rebooted to=
=20
> > recover (flushing out the connection tracker might work aswell but that=
=20
> > doesn't really make the problem less severe).
> >=20
>=20
> The problem is with a conntrack patch that Red Hat is including from an
> old Alan Cox tree. It seems to leak memory somewhere so that if you look
> in /proc/net/ip_conntrack it is 'empty' but if you look at
> /proc/slabinfo it is full.=20
>=20
> The problem can show up pretty quickly if the ip_conntrack_ftp is loaded
> on a heavy server. My fix has been to get a 2.4.25 kernel and compile it
> as an RPM and use it.=20
>=20
> Beyond that, maybe RH will offer a fixed kernel for RHL-9, but I am
> doubting it.

Yeah, and if they don't just switch to SuSE ;-)

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-yRGxDlEqL3idBNpVKJ6C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAYmtyh1fuR/Bv+ygRAkqUAJ9pGYvmhSDBTHOEcApG00jlXD3kWQCfY3V+
Ewj2XQQtGBf7kqpt63UIsX8=
=i1qJ
-----END PGP SIGNATURE-----

--=-yRGxDlEqL3idBNpVKJ6C--


