From: "Michael P. Soulier" <michael_soulier@mitel.com>
Subject: preserving fwmarks through KLIPS
Date: Mon, 10 Jan 2005 16:36:57 -0500
Message-ID: <1105393017.12167.24.camel@latte.nssg.mitel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Kw/3bjrEQxed0ntYWlu0"
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


--=-Kw/3bjrEQxed0ntYWlu0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to classify ipsec and non-ipsec traffic on the external
interface of my box. I plan to use fwmarks in iptables, and then rely on
those for queueing classification on the external interface.=20

My question is, if I mark a packet before it is encrypted by KLIPS in
FreeS/WAN, when it is re-injected with a new IP header, will that fwmark
be maintained?=20

Looking here:

http://iptables-tutorial.frozentux.net/iptables-tutorial.html#MARKTARGET

it is not clear. I'm going to do some testing but I was hoping that
someone might have a definitive answer.=20

I am using kernel 2.4.21.=20

Thanks,
Mike

--=20
Michael P. Soulier <michael_soulier@mitel.com>, 613-592-2122 x2522
6000/6010/60* Development, Mitel Corporation
"...the word HACK is used as a verb to indicate a massive amount of
nerd-like effort." -Harley Hahn, A Student's Guide to Unix


--=-Kw/3bjrEQxed0ntYWlu0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBB4vV5KGqCc1vIvggRAk4GAKDCVTdJBko4Niu5IARkUqd/rxwHEACbBLT0
gYP+e6wrCK0iPODLr7qyVic=
=vOaU
-----END PGP SIGNATURE-----

--=-Kw/3bjrEQxed0ntYWlu0--


