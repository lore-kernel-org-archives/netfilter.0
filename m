From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: ICMP TTL=255
Date: Wed, 5 Mar 2003 18:23:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030305172331.GE12124@ynfonatic.de>
References: <3E65FC55.9050400@imos.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E65FC55.9050400@imos.net>
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


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2003 at 02:32:05PM +0100, Ulrich Weber wrote:
> Hi,

Hi Ulrich,
=20
> I don't think that it's iptables fault, but I don't know where to ask els=
e.
> ICMP Ping ignores the TTL value of net/ipv4/ip_default_ttl and use 255.

if you mean with "ICMP Ping" your /bin/ping, it sets it's own TTL value. pi=
ng
uses raw-sockets to send it's data, so i can set it's own values. What it
likes. Btw: That's the reason why ping has the suid-bit set, only root is
allowed to open raw-sockets.

> All other traffic use the net/ipv4/ip_default_ttl value.

Since they don't use raw-sockets.

> Greets
>  Ulrich

Alex.


--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj5mMpMACgkQEMMZKORQoYJ6RwCfX+fC/PZL1i0zvSfkbP+tozcg
02QAn32vemeKWirx3DV5JCWTalsbnhkj
=m+VK
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--

