From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Noob Question
Date: Fri, 31 Oct 2003 16:25:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067610339.16920.33.camel@raylinux.internal>
References: <NGBBLGFEALDADHNDAAFFOEPIDMAA.kevin@perfht.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-p9AU5830cWaY0P2ToPWv"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBLGFEALDADHNDAAFFOEPIDMAA.kevin@perfht.com>
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


--=-p9AU5830cWaY0P2ToPWv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-10-31 at 16:13, Kevin Smith wrote:
> Does IPtables need to be recompiled every time you roll a new kernel?
> I just compiled 2.4.22 and when my firewall (Shorewall) started, it
> spit some "device busy" errors with ip_tables.o.=20
> Kev
No. The kernel source includes (at least as far as I recall) the
iptables kernel space drivers/programs/libraries.

The userspace tools (the iptables executables used to manage rules) are
separate, and do not get recompiled every time you recompile the kernel.

The exception would be if you have iptables v0.1.0 (for example)
userspace programs and in your kernel have iptables v1.2.8 source code,
then there would be a mismatch, and the userspace programs may be
incompatible with the kernel modules.

Best to keep them all the same.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-p9AU5830cWaY0P2ToPWv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/onDjh1fuR/Bv+ygRAhW1AKC0sTbff+onIAhOma/+/4qTjVBSywCfSts8
fh3AlL74FRb6GOa6NsfrkVQ=
=9zu/
-----END PGP SIGNATURE-----

--=-p9AU5830cWaY0P2ToPWv--


