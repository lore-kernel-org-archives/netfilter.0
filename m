From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: OUTPUT chain, Source Port 80 ---> Destination Port Unprivileged
Date: Sun, 20 Nov 2005 14:13:03 -0500
Message-ID: <4380CABF.2060705@rosi-kessel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig76AA3125E1599ACB8CBF7265"
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig76AA3125E1599ACB8CBF7265
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I've noticed that I occasionally have output packets on my webserver that=

have source port 80 and a destination port > 1024 (I've recently seen 491=
1,
4912, 49440, 49521, and 50296).

My current OUTPUT policy drops outbound traffic except on ports that are
specifically allowed. The unprivileged ports are not currently allowed.

I've seen a few sample iptables rulesets that allow outbound traffic to
unprivileged ports from source port 80.

Can someone explain to me why this happens, or point me to an explanation=

elsewhere?  Are there reasons to allow (or not to allow) such traffic, i.=
e.,
with a rule like:

iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp -s $IPADDR 1024:65535 \
		--source-port 80 --destination-port "1024:65535" -j ACCEPT

?
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org


--------------enig76AA3125E1599ACB8CBF7265
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDgMrBdTf3ZklQ6qYRApNLAJ44UXSrrfH9XaTXGeUu3tClign/YQCeOCZ/
JrxImF3jvfYl2+y0nMdSSvI=
=roM7
-----END PGP SIGNATURE-----

--------------enig76AA3125E1599ACB8CBF7265--

