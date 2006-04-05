From: Tom Eastep <teastep@shorewall.net>
Subject: Re: bad tcp checksum
Date: Wed, 5 Apr 2006 09:20:30 -0700
Message-ID: <200604050920.31151.teastep@shorewall.net>
References: <4433E766.9080409@denouden.info>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2603310.S80IT5bjrr";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4433E766.9080409@denouden.info>
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

--nextPart2603310.S80IT5bjrr
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 05 April 2006 08:51, Jan den Ouden (ml) wrote:
> Hi,
>
> I'm seeing a strange problem with kernel 2.6.12 Xen domain0 with all
> netfilter options compiled in. I'm trying to do port forwarding to an
> internal machine from an internet gateway box.
>
> What works ok is forwarding from gateway:143 to internalmachine:143.
>
> But when I forward from gateway:1000 to internalmachine:143 I get bad
> TCP checksums on the return packets. These packets are ignored on the
> client machine on the external internet.
>

I suggest that you search the Xen-users list archives -- this issue has bee=
n=20
discussed ad nauseum.

=2DTom
=2D-=20
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key

--nextPart2603310.S80IT5bjrr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEM+5PO/MAbZfjDLIRAh6GAJ9dx9ifXcKwvSEESTt2Ekdv311fQwCgi/QP
XVbW0jgwcnPy3tNk13xd3aU=
=WeqL
-----END PGP SIGNATURE-----

--nextPart2603310.S80IT5bjrr--

