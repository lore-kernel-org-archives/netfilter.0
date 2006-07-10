From: Rene Mayrhofer <rene.mayrhofer@gibraltar.at>
Subject: Re: do_IRQ: stack overflow
Date: Mon, 10 Jul 2006 14:17:35 +0100
Message-ID: <200607101417.39519.rene.mayrhofer@gibraltar.at>
References: <200607071547.51437.rene.mayrhofer@gibraltar.at>
	<4354d3270607100608o15eff2b7w38168ece9a7cae9c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6503852.iLfMfLtGRq";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4354d3270607100608o15eff2b7w38168ece9a7cae9c@mail.gmail.com>
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
To: =?iso-8859-1?q?T=F6r=F6k?= Edvin <edwintorok@gmail.com>
Cc: netfilter@lists.netfilter.org

--nextPart6503852.iLfMfLtGRq
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Monday 10 July 2006 14:08 schrieb T=F6r=F6k Edvin:
> On 7/7/06, Rene Mayrhofer <rene.mayrhofer@gibraltar.at> wrote:
> > Hi all,
>
> Hi,
> [why did this mail got delayed 3 days?
> Received: from localhost ([127.0.0.1] helo=3Dvishnu.netfilter.org)
> 	by vishnu.netfilter.org with esmtp (Exim 4.60 #1 (Debian))
> 	id 1FzulL-0003tk-Tz; Mon, 10 Jul 2006 14:21:19 +0200
> Received: from jupiter.gibraltar.at ([80.120.3.32])
> 	by vishnu.netfilter.org with esmtps (Exim 4.60 #1 (Debian))
> 	id 1Fys2y-0001ni-3E
> 	for <netfilter@lists.netfilter.org>; Fri, 07 Jul 2006 17:15:13 +0200
> ]
Maybe because of problems with my current line? Hmm, but actually it=20
shouldn't. Strange.

> Is this similar to:
> http://oss.sgi.com/archives/netdev/2004-12/msg00484.html?
I read that thread, but I think it's not really applicable because:
=2D I use IPSec, and according to the stack trace that seems to be part of =
the=20
problem.
=2D I still use kernel 2.4.32, so the patch given in that thread does not a=
pply=20
at all (I tried, but didn't look into the details).

> Does your system continue to work after this, or does it flood your logs?
No, it does not work - the only think that can be done is a complete=20
(hardware) reset.

Thanks,
Rene

=2D-=20
=2D------------------------------------------------
Gibraltar firewall       http://www.gibraltar.at/

--nextPart6503852.iLfMfLtGRq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEslNzq7SPDcPCS94RAnVDAJsHVOsdxQb1fbg5I0yzNz3XC5rq7QCfRn26
GXbI2BYUHtXOCVOYkkgrkPE=
=SVcE
-----END PGP SIGNATURE-----

--nextPart6503852.iLfMfLtGRq--

