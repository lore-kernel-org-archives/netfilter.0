From: Steffen Schoenwiese <ss310636@inf.tu-dresden.de>
Subject: Problem with DNAT
Date: Sat, 9 Nov 2002 18:36:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211091837.00935.ss310636@inf.tu-dresden.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I have some problems with iptables 1.2.7a. Some of my rules which worked =
well=20
with iptables 1.2.5 produce an error message "iptables: Invalid argument"=
=2E=20
The specific rules look like this:

iptables -t nat -A OUTPUT -p tcp -d <ip> -j DNAT --to <ip>:<port>

I also tried to use --to-destination instead of --to, same error message.
All my other rules work perfect, only the DNAT ones get this error.=20
Does anyone have a possible solution?

Steffen =20

- --=20
Quote of the minute:

"Premature optimization is the root of all evil."   =20
=09-Donald E. Knuth
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9zUe7ByWeP+lxCPMRAmuOAKC0UimprHxQb+TqyT8QZlLP/n1Q+gCgilKT
Wdo7eVFbg3FJshcDVBmrX88=3D
=3DGyFD
-----END PGP SIGNATURE-----


