From: Eric Leblond <eric@regit.org>
Subject: Re: NFQUEUE target + queue-bypass option, expected behavior
Date: Thu, 13 Feb 2014 21:20:44 +0100
Message-ID: <1392322844.17306.117.camel@ice-age2.regit.org>
References: <52FCF0CD.9030202@univ-nantes.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-ZI5pcCFV7/5b3wmizqul"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <52FCF0CD.9030202@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org


--=-ZI5pcCFV7/5b3wmizqul
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Bonjour,

On Thu, 2014-02-13 at 17:20 +0100, Yoann Juet wrote:
> Hi all,
>=20
> I have two questions about NFQUEUE target and queue-bypass option. To=20
> begin with, what is the expected behavior with iptables v1.4.14 ?
>=20
> (*) extract from the manual page of iptables v1.4.14:
>         --queue-bypass
> 	[...] When this option is used, the NFQUEUE rule is silently
> 	bypassed instead. The packet will move on to the next rule.
>=20
> (*) extract from the manual page of iptables-extensions v1.4.20+:
>         --queue-bypass
> 	[...] When this option is used, the NFQUEUE rule behaves like
> 	ACCEPT instead, and the packet will move on to the next table.
>=20
> On a standard debian/stable machine (wheezy, iptables v1.4.14), all=20
> packets are accepted if no userspace program is listening on an NFQUEUE.=
=20
> Next iptables rules are never matched. A man-page mistake ?

Yes, no code change in between but a fix in the man page.

>=20
> Assuming that this is the expected behavior (ACCEPT), a second question=
=20
> arises. I'd like to merge on a single machine firewall=20
> (netfilter/iptables) and IPS (suricata) services. In case of suricata=20
> failure, the firewall should run into a degraded state where packets=20
> move on to the next rule (i.e. to L3/L4 firewall rules). Is it=20
> technically possible with iptables v1.4.14 or higher versions ? In my=20
> point of view, omitting queue-bypass option could be too disruptive for=
=20
> a L7 firewall whereas inserting it is far too permissive.

Good analyse.

> ---
> Just to refine my setup, the following rule is added at the first=20
> position of the table FORWARD:
>=20
> iptables -I FORWARD  -m mark ! --mark 1/1 -j NFQUEUE --queue-num 0=20
> [--queue-bypass]

> All next rules are L3/L4 traditional firewall rules.

Would it be possible for you to use the mangle table ? Something like:

iptables -A FORWARD -t mangle -m mark ! --mark 1/1 \
	-j NFQUEUE --queue-num 0 --queue-bypass

If you have no accept rule in mangle table then adding this rule at the
end will guarantee that all packet are seen by Suricata.

By the way, if you want a bit more of performance you can use the queue
balance feature:

iptables -A FORWARD -t mangle -m mark ! --mark 1/1 \
	-j NFQUEUE --queue-balance 0:4 --queue-bypass

Then you can start Suricata with option -q 0 -q 1 -q 2 -q 3.

BR,
--=20
Eric Leblond <eric@regit.org>

--=-ZI5pcCFV7/5b3wmizqul
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iD8DBQBS/SkcnxA7CdMWjzIRAtTsAJ9wWjaM4qFoyeTis2zGUioVhSBFLgCdH00r
DhhrcfZ8oRn5iqgYbmhyv5A=
=vtW0
-----END PGP SIGNATURE-----

--=-ZI5pcCFV7/5b3wmizqul--

