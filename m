From: Alexander Samad <alex@samad.com.au>
Subject: Re: forwarding rule (internal webserver) HELLPP!!
Date: Tue, 16 Mar 2004 13:13:46 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040316021346.GG26800@samad.com.au>
References: <20040315191020.11187.qmail@web10205.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DHioQtdaSVZskSfq"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040315191020.11187.qmail@web10205.mail.yahoo.com>
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


--DHioQtdaSVZskSfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2004 at 11:10:20AM -0800, arif wrote:
> Anyone know why the following rule does not work when
> i use SNAT but does when i use MASQUERADE??
>=20
> /sbin/iptables -A PREROUTING -t nat -p tcp -d 63.x.x.x
> --dport 80 -j DNAT --to 10.0.0.3:80
>=20
> When I use the following rule, the previous rule
> works:=20
> /sbin/iptables -t nat -A POSTROUTING -o eth1 -j
> MASQUERADE
>=20
> but when i do it like this, i just get a connection
> refused from the outside:
> /sbin/iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o
> eth0 -j SNAT --to-source 63.203.63.246

Not sure if its a typo MASQ is for eth1 and the SNAT is for eth0=20

>=20
> Both work as far as NAT'ing my internal hosts, but i
> cant get the darn forward to work! thanks!! :)
>=20
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail - More reliable, more storage, less spam
> http://mail.yahoo.com
>=20
>=20

--DHioQtdaSVZskSfq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVmLakZz88chpJ2MRAu7BAJ9ZH1LDXn3PSjNXqOdhlT1CgFzgGwCffMHz
Oz6k+mlrz1BcZuLKVI0lPek=
=YJe7
-----END PGP SIGNATURE-----

--DHioQtdaSVZskSfq--

