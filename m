From: Harald Welte <laforge@netfilter.org>
Subject: Re: Rule matching question [iptables code structure]
Date: Mon, 12 May 2003 10:41:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030512084145.GG3344@sunbeam.de.gnumonks.org>
References: <df0d10589.10589df0d@student.mh.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <df0d10589.10589df0d@student.mh.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: hewa0000@student.mh.se
Cc: netfilter@lists.netfilter.org, oan@itm.mh.se


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2003 at 02:56:45PM +0200, hewa0000@student.mh.se wrote:
> =20
> When we add a rule to iptables that filter on
> MAC-address (or IP address and port for that
> matter). Does iptables ONLY check for the
> MAC-address option (alas in that case we filter on
> MAC-address)?.

> Based on a the report "Performance analysis of the
> Linux firewall on a host" by James Harris and
> Americo J. Melara. It is stated that for each check
> if the MAC-address in the rule match the given
> MAC-address, the Iptables-algorithm ALWAYS checks
> all possibilities (MAC-address, IP, Port, Protocol,
> Interface..).=20
> Does anyone know this to be the truth?

It doesn't check all possibilities.  However, there is the ip_tables
core that matches ip src/dest, incoming/outgoing interface, l4protocol.
Please see linux/net/ipv4/netfilter/ip_tables.c:ip_packet_match() for
more information.

After this ip_tables core check was made, any extensions are checked,
and ipt_mac.c is one such extension.

> We are currently working on a big project where we
> use big lists of rules that are based on MAC and
> IP-addresses. And we are trying to understand why
> these lists of rules crave so much computation power
> to execute.

You are linearly iterating over long lists.  This raises computational
complexity.  Try building a tree-like structure made of lots of chains
with little number of rules in every chain.  This reduces the average
number of rules to be iterated per packet. =20

That is a general rule of thumb when designing any iptables ruleset.

> If Iptables always run a check for every possible
> way to match our packet with a single rule
> (ip,mac,protocol,interface...) it consumes alot more
> (actually we belive it to be around 6 times as much
> according to the nature of the algorithm) as necessary.=20
>=20
> Optimally the algorithm would ONLY check for a
> MAC-Address match if that is what we are filtering
> on. We truly hope this also is the case. But please,
> someone who knows this :-) :

there is not much of an 'algorithm' involved.

> Sincerly,
> Open Access Networks Project MidSweden University.
> oan@itm.mh.se

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+v15JXaXGVTD0i/8RAjV8AJ0V5MThc6aben+UvF9Z+6xuwg+hwgCgmhoX
97GEbVVrNlQwhg56AnQ5Lek=
=zTc7
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--

