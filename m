From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: Linux/Windows pure SSL "VPN" Solution
Date: Wed, 2 Jun 2004 17:51:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040602215159.GD7480@alcove.wittsend.com>
References: <564DE4477544D411AD2C00508BDF0B6A206AAD93@usahm018.exmi01.exch.eds.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <564DE4477544D411AD2C00508BDF0B6A206AAD93@usahm018.exmi01.exch.eds.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Small, Jim" <jim.small@eds.com>
Cc: netfilter@lists.netfilter.org


--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2004 at 02:10:08PM -0400, Small, Jim wrote:
> I have a situation (common) where I need access to my corporate network, =
but
> the vendor will only allow traffic over ports 80 and 443.  The vendor wou=
ld
> like me to do an SSL VPN as they do not want to open other ports (read--no
> IPSec).  I would like to do a Linux proof of concept solution using iptab=
les
> and some sort of Open Source SSL VPN (Linux server sitting on the Internet
> or in one of our DMZs).

> This looks promising:  http://www.hsc.fr/ressources/outils/ssltunnel/
> It's just what I'm looking for but it doesn't support Windows clients.

	When I've been forced to do this, I generally use ppp over stunnel,
<www.stunnel.org>.  There are Windows binaries for stunnel, but getting
ppp running on that side may be a challenge.

	My general preference is IPSec NAT-T, which runs over 500/udp
and then 4500/udp, when straight IPSec (IP 50/51) is blocked but UDP
is open.

	Worse comes to worse, check out CCTT.  The Covert Channel Tunneling
Tool.  Lots of goodies in that set for tunneling under the worst of
circumstances.

	Which ever I use, I then layer IPv6 over top of that transport
and then have a complete routable addressable infrastructure I can access.

> I've looked at OpenVPN, CIPE, and vTun, but none of them appear to work o=
nly
> over port 443.  OpenVPN works over 443, but also requires UDP/5000 which =
is
> not possible.

	They have all UDP ports blocked (in bound and out bound)?  That
could be challenging, then.  Generally, once you initiate a connection
from the inside out, you can keep the ports open.  IPSec NAT-T seems
to include a keep-alive that keeps NAT tables fresh once the SAs are
established.

> Does anyone know of a pure (TCP/443 only) SSL Open Source solution?

> Thanks,
>    <> Jim

> PS  I realize this is not a pure iptables question, so I'm prepared for
> flames...  ;-)

	Mike
--=20
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=3Dmhw=3D|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/=
mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iQCVAwUBQL5L/+HJS0bfHdRxAQHlkAP/TrV81YJ2TbCpGgXGoBH+TBnVw1HWDYOD
RA9U4weQYtlZV9+RozMkglWUVv6qDuFjC/x1UTNi2ea2fHJj8r3Wb+hux/1EgLGv
EDEc09EdJb8Jx2WwdCC32Tl9hAwour5rYxRolPVElc+8L4fAaGAvJcsLFmtOA/zq
92X6q8URsA4=
=jODK
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--

