From: Stephen Frost <sfrost@snowman.net>
Subject: Re: question on recent module
Date: Fri, 24 Jan 2003 20:33:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030125013327.GO484@ns.snowman.net>
References: <001901c2c3b3$5adfe4a0$3201a8c0@leonardo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001901c2c3b3$5adfe4a0$3201a8c0@leonardo>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Cc: netfilter ML <netfilter@lists.samba.org>


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Leonardo Rodrigues ( listas ) (leolistas@solucoesip.net) wrote:
>     I'm trying to setup recent module for doing some great things here :)
> Basically what I want is. Match some kind of traffic and, if that happens,
> traffic for that source address will be completly and silently dropped. A=
ll
> examples of recent module I found were used on FORWARD chain, which is not
> my case, as machine running recent will be the final destination of the
> connection.
>=20
>     So, seems I'm successfully matching packets I need (
> /proc/net/ipt_recent/myrulename ) is created and sources are being added
> there. What I need now is: how can I make a rule on filter OUTPUT to DROP
> all traffic if the source address was matched by recent module ? As I rea=
d,
> I can only check recent matches against source address ( --rcheck ). In
> OUTPUT chain, source address is my own address and the address I need to
> match is the DESTINATION one.
>=20
>     Can recent module help me in this situation ? Hope you understood it.
>=20
>     Anyway, thanks for your attention :)

Using the latest versions of ipt_recent you can match against the
destination IP address.  I know it's not very clear, but you can use
--rdest in a 'check' rule too, and it will take the destionation IP
address of the packet and look it up in the recent list.

	Stephen

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+MelnrzgMPqB3kigRAjBXAJsGp3njKI6ZD7mIZLjEoRPJK372WgCfdPuB
Iqvy1XrlsW+lrj14n1RmNYY=
=VSu8
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--

