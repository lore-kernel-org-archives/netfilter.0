From: Tim Waugh <twaugh@redhat.com>
Subject: SNMP conntrack module a la netbios_ns
Date: Fri, 04 Dec 2009 09:53:09 +0000
Message-ID: <1259920389.2510.30.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-XzL0s5817OS0YHShJMxg"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-XzL0s5817OS0YHShJMxg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I maintain the printing stack for Fedora and Red Hat Enterprise Linux,
and I've become aware of a need for another conntrack module very
similar to nf_conntrack_netbios_ns.

When CUPS searches for network printers it issues an SNMP broadcast
query from a random source port and to the SNMP destination port, and
waits for (unicast) replies from printers, following up each reply with
a set of unicast SNMP queries.

The problem is that the iptables rules discard the replies to the
initial broadcast query.

It looks like a conntrack module is what's needed to fix the problem,
and the netbios_ns module very nearly solves it: the only changes I can
see would be needed are the port number and the maximum number of
expected replies.

Is this something that warrants a more generic module so that code can
be shared between them, or would it be better to just copy the code and
make the changes?

Thanks,
Tim.
*/


--=-XzL0s5817OS0YHShJMxg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iD8DBQBLGNwCBLQafZpK2tcRAsV2AJ4mUUq7RscywpiRuKAqwgCGxaJwyQCfS44u
LZe+jaYBqEYsJeivCKWnvtI=
=suBs
-----END PGP SIGNATURE-----

--=-XzL0s5817OS0YHShJMxg--

