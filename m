From: Eric Leblond <eric@inl.fr>
Subject: Re: SMB auth and Iptables...
Date: Fri, 30 Jul 2004 09:20:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091172036.4496.3.camel@porky>
References: <001301c475ae$2fc4c340$0200a8c0@marduk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-/aHtYqahxGig+tC/x2wp"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c475ae$2fc4c340$0200a8c0@marduk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Gustavo Castro Puig <gcastro@gcp.com.uy>
Cc: netfilter@lists.netfilter.org


--=-/aHtYqahxGig+tC/x2wp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


You could use NuFW : http://www.nufw.org to build an authenticating
firewall. There's no direct interaction with samba but if users are
stored in ldap it should be possible to have products work together.

On Thu, 2004-07-29 at 22:51, Gustavo Castro Puig wrote:
> Hi, guys:
> =20
>     One customer asked me about the possibility of install in an
> iptables based firewall some sort of solution (perhaps a proxy) it
> could add/delete rules based on users login into a SMB(Samba/NT)
> server. He want to grant or deny access to Internet (TCP/IP) based
> on authenticated users, not the IP or MAC. It's not a bad idea, but I
> don't know if it even exists... I've googled and found nothing about
> this kind of solution. Anyway, I told him I could check it out, and...
> here I am. :-)
>     Do you have any idea about a solution like this using iptables and
> "something" else?=20
>     Any info will be highly appreciated.
>     Thanks!
> =20
> Cheers,
>     Gustavo.
--=20
Eric Leblond <eric@inl.fr>
INL

--=-/aHtYqahxGig+tC/x2wp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBCfbDnxA7CdMWjzIRAtz5AJ49cPweDdFf9SDtTFzGtDE09Wk+UACgiqGt
8J1eL2VnJXpz7DbXemY2T1c=
=JlxC
-----END PGP SIGNATURE-----

--=-/aHtYqahxGig+tC/x2wp--


