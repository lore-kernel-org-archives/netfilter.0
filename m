From: Harald Welte <laforge@netfilter.org>
Subject: Re: Unable to stop tunnel from being "connection-tracked"
Date: Fri, 3 Oct 2003 12:15:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003101539.GR5758@sunbeam.de.gnumonks.org>
References: <1065093009.24289.193.camel@wouter.fw.belnet.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E0nEvEEGZbduMG2g"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1065093009.24289.193.camel@wouter.fw.belnet.be>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Wouter Vanwalleghem <wouter@belnet.be>
Cc: netfilter@lists.netfilter.org


--E0nEvEEGZbduMG2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2003 at 01:10:09PM +0200, Wouter Vanwalleghem wrote:
> hi all,
>=20
> I have setup a 6-in-4 tunnel which is giving me head-aches.
> FYI, I use kernel 2.4.21 and iptables 1.2.8.
>=20
> As soon as I start using the tunnel the output of "cat
> /proc/net/ip_conntrack" shows a protocol 41 connection between my
> firewall and the IPv4 PoP of the tunnelbroker.=20
> OK so far.=20

yup.  That's how it is on my 6to4 tunnel gateway, too.

> Thing is that the tunnel "dies" as soon as the connection has
> disappeared from the connection tracking table.
>=20
> After some research I followed a suggestion to keep the tunnel from
> being connection tracked.

impossible with stock iptables.=20

> However, the following iptables rules do not prevent the tunnel from
> popping up in the connection tracking table:
>=20
>=20
> #####------------ IPv6 tunnel to SixXS-----
> iptables -A INPUT -p 41 -s tunnelserver.concepts-ict.net -j ACCEPT
> iptables -A OUTPUT -p 41 -d tunnelserver.concepts-ict.net -j ACCEPT
> iptables -A INPUT -p icmp --icmp-type echo-request -s
> tunnelserver.concepts-ict.net -j ACCEPT
> iptables -t nat -A POSTROUTING --protocol ! 41 -s 192.168.100.0/24 -o
> ppp0 -j MASQUERADE

Why should this prevent connection tracking from tracking the tunnel?
Connection tracking always tracks all packets, as described in the docs.

It's just a quesion on whether you want to use the information provided
by conntrack or not.  And this totally depends on your ruleset.

> Anybody have a clue?

This has to be somehow related to your local setup/configuration.  I am
running 6to4 tunnels on a lot of firewalls without any problems.

> kind regards,
> Wouter

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--E0nEvEEGZbduMG2g
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fUxLXaXGVTD0i/8RAsFAAKCAEa3o+/HfnhkCgXk3AeHa9y9jrgCfeV8+
F0AwSfzKnm1eMEJIpiiu3/E=
=aa/n
-----END PGP SIGNATURE-----

--E0nEvEEGZbduMG2g--

