From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: off topic: routing question
Date: Tue, 11 Mar 2003 08:13:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030311071356.GA27882@ynfonatic.de>
References: <006101c2e737$3b8c8e80$3864a8c0@discmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <006101c2e737$3b8c8e80$3864a8c0@discmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Aldo S. Lagana" <alagana@discmail.com>
Cc: netfilter@lists.netfilter.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2003 at 01:59:52PM -0500, Aldo S. Lagana wrote:
> How do I (using iproute2, etc.) get one linux gateway to forward packets
> to another linux gateway based on port?

The simplest solution would be maybe fwmark:

# Mark all 80/tcp traffic with 0x42
iptables -t mangle -A PREROUTING -p tcp --dport 80 -j MARK --set-mark 0x42
# Create new routingtable with new default-route where $NEW_GW is IP of
# gateway
ip route add default via $NEW_GW table 42
# Now force marked traffic to use this brandnew routingtable
ip rule add fwmark 0x42 lookup table 0x42

> I just want to do policy based routing by port to another router.  I've
> read the Advanced Routing HOWTO and I cannot find the answer there -
> please someone enlighten me!

Hope this illuminates you :)
=20
Alex.

--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj5tjLMACgkQEMMZKORQoYJDagCfRjPqPh37Op02xcZjrJBnSapY
kWgAn0o0tuzAS8udBx2yCEnRICDyh3HU
=DSNj
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

