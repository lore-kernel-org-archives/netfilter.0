From: Joshua Goodall <joshua@myinternet.com.au>
Subject: Re: differences between win and unix tcp clients.
Date: Wed, 17 Mar 2004 02:07:46 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040316150746.GA8506@myinternet.com.au>
References: <024b01c40b4f$e3341620$3f32a8c0@ds.ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <024b01c40b4f$e3341620$3f32a8c0@ds.ig.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Fabiano Reis <silos.reis@ig.com.br>
Cc: netfilter@lists.netfilter.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(netfilter-devel removed from CC list)

On Tue, Mar 16, 2004 at 09:12:01AM -0300, Fabiano Reis wrote:
> Conclusion: I think this was because the Windows implementation of TCP de=
tects something different on this connection, maybe it detects in some way =
that there is a filter on the server side and this is why the time for the =
error message take so long to appear.

Basically yes.  I wouldn't say that Windows "detects something
different".   I would say that the Windows client isn't properly
interpretating the ICMP Port Unreachable message.

> Am I right? Is there a workaround for this problem? I need to make window=
s think that the server is really "down" and that is why i?m writting to yo=
u people.

try extending your REJECT option:

-j REJECT --reject-with tcp-reset

which should give you the desired result, in exchange for being
a crude pseudo-rejection.

Joshua.

--=20
Joshua Goodall <joshua@myinternet.com.au>
Solutions Architect / Principal Security Architect
myinternet Limited.

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVxhCo8kg3R/NoUQRAjj8AKDLZK9VisDc/jiEAyKJTPu9iOzxNACcCqil
XJKg+LpMd2Crj2hsXAo6GrI=
=jxRr
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--


