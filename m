From: Harald Welte <laforge@netfilter.org>
Subject: Re: Question about ip_nat_pptp with netfilter
Date: Mon, 19 May 2003 18:14:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030519161402.GA28587@sunbeam.de.gnumonks.org>
References: <KAEEJPEMJEFIBCCENPHFEEAPDCAA.nao@huns.jp>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <KAEEJPEMJEFIBCCENPHFEEAPDCAA.nao@huns.jp>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Nao Yamada <nao@huns.jp>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2003 at 05:26:31PM +0900, Nao Yamada wrote:
> Dear Laforge-san
>=20
> I appreciate your work!!!

Thanks, you're welcome.

> I have a question for you about ip_nat_pptp with netfilter.
>=20
> If you have FAQ page or anything, please teach me.
> At first I will visit them.

No, there is no FAQ explicitly for the PPTP code.

> I'm using linux-2.4.20 and I would like to use NAT_PPTP modules.
> I've downloaded patch-o-match-20030107 and iptables-1.2.8 from netfileter
> site.
> I've done the following.
> 1../runme base
> 2../runme extra
> 	select pptp_nat
> 3.compile and install the kernel.
> 4.compile and install the iptables
> 5.modprobe ip_nat_pptp
> 	loaded ip_conntrack_pptp ip_conntrack_proto_gre modules

that's exactly the right way to do it.

> But I could not connect pptp(POPTOP) server on linux box.
>=20
> 6.rmmod ip_nat_pptp
>=20
> I could connect pptp server on the linux box.

Why do you want to load the pptp helper module, if you have the server
on the local machine?

the NAT module is for NATing pptp clients behind a linux NAT gateway.
No need for a pptpd (poptop/...) on the NAT gateway it self.

> What do I have to do anything in above others???

There is a bug in the current helper, which prevents a locally-running
pptp server on the NAT machine.  I have a fix here, but I still need to
test it...

> I've read the ip_nat_pptp.c.
> You wrote "need netfilter newnat code".
> What do you mean?
> What virsion is this newnat?

newnat is in the mainstream linux kernel since 2.4.19.

> Thanks in advance,
> Nao

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+yQLKXaXGVTD0i/8RAmREAJ4qESEodoK3tn/X/JI0nzRUvw4nBgCeIz59
ps/6SGiW5i/VhzPofeDoMpE=
=dvFW
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--

