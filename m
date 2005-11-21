From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Why TCP does NOT have explicit LENGTH field like UDP & IP packets
	do!?!?
Date: Mon, 21 Nov 2005 09:46:11 -0800
Message-ID: <1132595171.5180.98.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-cM2JP7iBG8EW/WgvZcSp"
Return-path: <netfilter-bounces@lists.netfilter.org>
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


--=-cM2JP7iBG8EW/WgvZcSp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


I'm curious why TCP does not have an explicit length field like
UDP and IP packets do.

It appears from TCP RFC 793 that lower (IP) layer must provide
*some* way for TCP to figure out length.  This is vague
and weird that length is handled this way.....

=46rom RFC 793 page 50 with regards to layer below TCP...

"Any lower level protocol will have to provide the source address,
    destination address, and protocol fields, and some way to determine
    the "TCP length", both to provide the functional equivlent service
    of IP and to be used in the TCP checksum."



Any ideas?


Chris

--=-cM2JP7iBG8EW/WgvZcSp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQEVAwUAQ4IH48XAD6FzhZH3AQLZJgf+KfZskC03vfaLROvPWLjvlN8VVEergy8T
pyVwtTthrNiXt12NquA3TAfwZZnQcjDNMZD/kq4Rny61IowbFrD5CbNUpjg4AU6l
5HldfT2an5ROjyfC+0i+SVbRrVWq9B72NCW/as+i4a2tb5b/dQW3G2lCkImtFzFL
b3hmhfioPhR2KMWvXvN+aFRCXboDU6WBwfp+C7VY8MbHvh+kEp1cRrlvUz0tWEeh
flZutMuwrUCiirV3raZ5+izIVukKMePvnmcF4n4C9Jc5+x0HPf10jHU2zyes1+H3
c+9rRWL717aeYXa4BqXKFNLLJztXMD6THHgtDfWCXWfOdypNJurjzA==
=nGpR
-----END PGP SIGNATURE-----

--=-cM2JP7iBG8EW/WgvZcSp--


