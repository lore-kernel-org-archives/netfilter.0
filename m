From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: is it possible to limit the connection number?
Date: Wed, 5 Mar 2003 18:09:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030305170955.GD12124@ynfonatic.de>
References: <F599aZbLAX3cf3ednHM00004be2@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F599aZbLAX3cf3ednHM00004be2@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2003 at 07:48:50AM +0000, SB CH wrote:
> Hello all.
>=20
> I would like to limit the connection number per ip=20
> using iptables extension function.=20
> for example, one can connect the firewall behinded server just 10 per a=
=20
> hour.
>=20
> Is it possible to set using iptables?

You can use the limit-match for this:

iptables -A FORWARD -s $LIMITED_HOST -d $DESTINATION \
-m state --state NEW -m limit --limit 10/hour -j ACCEPT

But you need some dropping/rejection rule later as well. And be sure that y=
ou
have some rule which allows ESTABLISHED connections, like

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

But i think that's more a work for some application-proxy like Squid...
=20
> thanks in advance.

Hope that helps,
Alex


--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj5mL2IACgkQEMMZKORQoYIjQgCghzS+rm3pZd1OMInMhRpVPqgK
LwEAnRaTCM9/0CAOF5RuEU0BkFtz4vA+
=CozY
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--

