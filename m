From: Eric Leblond <eric@inl.fr>
Subject: Re: Logging source mac address
Date: Sun, 03 Oct 2004 16:14:40 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096812880.4477.1.camel@porky>
References: <415D19210004E96A@vsmtp1.tin.it> (added by postmaster@virgilio.it)
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-N89LbQHAZcjKUXWLt4XM"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <415D19210004E96A@vsmtp1.tin.it> (added by postmaster@virgilio.it)
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--=-N89LbQHAZcjKUXWLt4XM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-10-01 at 23:45, Marco Reale wrote:
> Hi
> Is there a way to log in all conditions (not only with drop or reject) th=
e
> source mac address???

To log source address you need to able to know it. This is not the case
if you are not directly connected to computer that drop via ethernet.
Thus this is the case for almost all internet IPs....

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-N89LbQHAZcjKUXWLt4XM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBYAlPnxA7CdMWjzIRAgveAJ9bf14tvLWnZU2pQ1ITQKI62fM9sQCfc+22
luqBrOj19qT8OVoWsLm+qw8=
=1ntJ
-----END PGP SIGNATURE-----

--=-N89LbQHAZcjKUXWLt4XM--


