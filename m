From: Thilo Schulz <arny@ats.s.bawue.de>
Subject: Re: ip6tables and iptables
Date: Sat, 12 Nov 2005 12:35:36 +0100
Message-ID: <200511121235.39563.arny@ats.s.bawue.de>
References: <dl4dr2$an3$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1596900.I441S2VGz8";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dl4dr2$an3$1@sea.gmane.org>
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

--nextPart1596900.I441S2VGz8
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 12 November 2005 10:49, Volkm@r wrote:
> My question is, does ip6tables completely replace iptables or do I have
> to configure and run both iptables AND ip6tables?

No, you still probably have both, ipv4 AND ipv6 addresses on your=20
interface(s). For the ipv4 part, the original iptables is still the program=
=20
to use to set up rules for ipv4. IPv4 and IPv6 rulesets are independent and=
=20
require their respective tools to modify them.

=2D-=20
Thilo Schulz

--nextPart1596900.I441S2VGz8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDddOLZx4hBtWQhl4RAiFDAJ90MlqF/tFsoyKrQY5lQ5ig6pRTCgCfcoUM
dRo3OprR9xZNphK7oEPALJ4=
=d2Jz
-----END PGP SIGNATURE-----

--nextPart1596900.I441S2VGz8--

