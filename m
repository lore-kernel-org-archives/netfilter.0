From: Stephan Uhlmann <su@su2.info>
Subject: nat:REDIRECT on localhost not working in Kernel 2.6
Date: Fri, 19 Nov 2004 18:36:02 +0100
Message-ID: <200411191836.07261.su@su2.info>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1818528.1Q1FlMFBn4";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
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

--nextPart1818528.1Q1FlMFBn4
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello netfilter friends,

I want to redirect all connections going to port 80 of a host to port 8080 =
of=20
the same host. Of course I do it with the REDIRECT target:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 8080

The redirection of externally incoming connections via PREROUTING  works=20
perfectly fine.

But I have the problem that locally generated connections are not redirecte=
d=20
on machines with Linux Kernel 2.6 but on machines with Linux Kernel 2.4.

I tested:
SuSE Linux 9.0 (Kernel 2.4.21, iptables v1.2.8)  - works
SuSE Linux 9.1 (Kernel 2.6.5,  iptables v1.2.9)  - does not work
SuSE Linux 9.2 (Kernel 2.6.8,  iptables v1.2.11) - does not work
Gentoo Linux   (Kernel 2.6.9,  iptables v1.2.11) - does not work

"iptables -t nat -L -v" shows that no packet at all was catched by the OUTP=
UT=20
chain. Instead it seems to go to the POSTROUTING chain. But the REDIRECT=20
target can't be used in the POSTROUTING chain.

Is this a bug? Is this a feature? Did something change between Kernel 2.4 a=
nd=20
2.6 in this regard?

I looked through the ChangeLogs and other docs but didn't find any hint.


Stephan

--nextPart1818528.1Q1FlMFBn4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBBni8H0TAeRPnvmyERAjZXAKCGwBpp4jpv60gaAsxYPmaMaDTr0ACfeYBq
ofNTEAtooO4YWyXqXoIFC/Y=
=MFoX
-----END PGP SIGNATURE-----

--nextPart1818528.1Q1FlMFBn4--

