From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Routing problem...
Date: Tue, 27 Jul 2004 16:21:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040727142132.GA29202@zion.homelinux.com>
References: <20040727072329.GV20473@freenet.de> <20040727074251.GA23024@zion.homelinux.com> <20040727080623.GZ20473@freenet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040727080623.GZ20473@freenet.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Michelle,

On Tue, Jul 27, 2004 at 10:06:23AM +0200, Michelle Konzack told us:
> >at which iptables invocation do you get this error exactly?? Try
> >executing the script with "sh -x scriptname" and look where the
> >error occurs.

What kernel version are you using, what version of iptables? Is
your kernel a vanilla kernel.org kernel, are the iptables
matches/targets build into the kernel or are they built as
modules??


Sven

>
> It is the line with the ESTABLISHED,RELATED
>
> I have found the lines in the Firewall-HOWTO=20
> and on <http://www.debianforum.de/>
>
> >Sven
>
> Greetings
> Michelle
>


--=20
Linux zion 2.6.8-rc2 #1 Sun Jul 18 15:00:48 CEST 2004 i686 athlon i386 GNU/=
Linux
 16:19:26  up 8 days, 17:47,  1 user,  load average: 0.10, 0.07, 0.10

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFBBmTso4FAdB2PneQRArLgAJsHusxnZPFge1V27ugigq/qMtUA4ACaAksr
WeoanteylRIzNfS/YZtT/YE=
=40vm
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

