From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: can't patch with patch-o-matic
Date: 18 Feb 2003 07:32:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045546373.18829.47.camel@rayw.knowledgefactory.co.za>
References: <5.2.0.9.2.20030217171848.01c2e5c0@172.26.0.8>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-8FQr6WzZk0feGq1WjrsC"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.2.20030217171848.01c2e5c0@172.26.0.8>
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


--=-8FQr6WzZk0feGq1WjrsC
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

You are probably missing the patch program.

Do rpm -qa | grep patch

Ray

On Mon, 2003-02-17 at 18:27, Luis Miguel Cruz Miranda wrote:
> Hi all,
>=20
> I am using patch-o-matic to patch a 2.4.20 kernel but I am having some=20
> problems here:
>=20
> For example:
>=20
> Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
> Testing patch extra/tcp-window-tracking.patch...
>     Placed new Makefile line
> Failed to patch copy of /usr/src/linux
> TEST FAILED: patch NOT applied.
>=20
> I want to use that patch but I don't know why I can't.
> I have these patches applied:
>=20
> Already applied: submitted/01_2.4.19
>                   submitted/02_2.4.20
>                   submitted/ipt_multiport-invfix
>                   submitted/ipt_ULOG-mac_len-fix
>                   pending/01_ip_conntrack_proto_tcp-lockfix
>                   pending/02_newnat-udp-helper
>                   pending/03_REJECT-fwspotting-phrack60-fix
>                   pending/04_ftp-conntrack-msg-fix
>                   pending/05_ECN-tcpchecksum-littleendian-fix
>                   base/fuzzy
>                   base/iplimit
>                   base/ipt_unclean-ubit
>                   base/ipv4options
>                   base/IPV4OPTSSTRIP
>                   base/mport
>                   base/NETLINK
>                   base/NETMAP
>                   base/nth
>                   base/pool
>                   base/psd
>                   base/quota
>                   base/random
>                   base/realm
>                   base/SAME
>                   base/time
>                   base/TTL
>                   extra/condition
>                   extra/CONNMARK
>                   extra/h323-conntrack-nat
>                   extra/ip_tables-proc
>                   extra/ipt_TARPIT
>                   extra/mms-conntrack-nat
>                   extra/pptp-conntrack-nat
>                   extra/recent
>                   extra/ROUTE
>                   extra/rsh
>                   extra/string
>                   extra/talk-conntrack-nat
>                   extra/tftp-conntrack-nat
>=20
> What is wrong?
>=20
>=20
> Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
> CCNA - Systems Administrator            |       Pol. Ind. de Asipo
>                                          |       C/A - Parcela 86-C
> Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
> Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN)


--=-8FQr6WzZk0feGq1WjrsC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+UcWFh1fuR/Bv+ygRAkLRAKC7RT0zk4XI1JM0UfQvVf+36Z8ZGQCgpEj2
znT4wAwVZZMn8nK5zX5Wr8c=
=gNUl
-----END PGP SIGNATURE-----

--=-8FQr6WzZk0feGq1WjrsC--


