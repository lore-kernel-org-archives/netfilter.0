From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: New not syn (again...)
Date: Sat, 2 Aug 2003 18:21:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030803012121.GA30501@home.tig-grr.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122E16@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E16@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2003 at 08:57:15AM -0700, Daniel Chemko wrote:
> Basically the client or the server sends out a FIN or RST to signify
> that they are done with the connection. The Conntrack would drop the
> session. Afterwards the other side sends out an acknowledgement that the
> session was dropped. The packets are flagged as not established, since
> the connection from the other side was closed. I think it depends on an
> IPTables conntrack timeout value to determine how long to wait for the
> other side's response.=20
>=20
> I don't know what everyone else does about them, but I generally just
> drop them It may not be that clean, leaving other PC's IP stacks timeout
> the session close, but it happens so rarely to me, *meh*

I use the following in my firewall script.  Maybe someone will find it
useful.  Note logdrop chain is exactly that: log, then drop the packet.

# Allow established connections to continue.  This is where the
# great majority of traffic will be accepted, so it is first.
iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT

# Any TCP packet which is not a part of an established connection falls into
# one of three categories: (1) connection handshake, (2) stray resend, or
# (3) invalid.  Here we discard stray resends and log obvious hack attempts.
# See table below:
#
# SYN RST ACK  What it means  Action
# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D
#  0   0   0   invalid        logdrop
#  0   0   1   stray resend   DROP
#  0   1   0   stray resend   DROP
#  0   1   1   stray resend   DROP
#  1   0   0   conn attempt   ok
#  1   0   1   conn response  ok
#  1   1   0   invalid        logdrop
#  1   1   1   invalid        logdrop

iptables -A INPUT   -p tcp --tcp-flags SYN,RST,ACK NONE    -j logdrop
iptables -A INPUT   -p tcp --tcp-flags SYN,RST,ACK ACK     -j DROP
iptables -A INPUT   -p tcp --tcp-flags SYN,RST     RST     -j DROP
iptables -A INPUT   -p tcp --tcp-flags SYN,RST     SYN,RST -j logdrop

iptables -A OUTPUT  -p tcp --tcp-flags SYN,RST,ACK NONE    -j logdrop
iptables -A OUTPUT  -p tcp --tcp-flags SYN,RST,ACK ACK     -j DROP
iptables -A OUTPUT  -p tcp --tcp-flags SYN,RST     RST     -j DROP
iptables -A OUTPUT  -p tcp --tcp-flags SYN,RST     SYN,RST -j logdrop

=2E.. script continues ...

--=20
America may be unique in being a country which has leapt from barbarism
to decadence without touching civilization.
        -- John O'Hara

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj8sY5AACgkQFMm9uvwPXW7mogCeISZSO9vds9RA37iDbXhALbdZ
L1MAnRhDoHxypWMxAhz+2ce0nBHpJEzy
=VRni
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--

