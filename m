From: Alexander Samad <alex@samad.com.au>
Subject: Re: Redirection to local lan, isn't DNAT method unsafe.
Date: Thu, 22 Apr 2004 13:49:21 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040422034921.GS3095@samad.com.au>
References: <40696C1A.5080400@personalsoft.com.br> <002a01c417c2$d94db7e0$de0aa8c0@comp>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ixDgnS8AC6zwmyK0"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002a01c417c2$d94db7e0$de0aa8c0@comp>
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


--ixDgnS8AC6zwmyK0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2004 at 10:25:06AM +0200, Bo Jacobsen wrote:
> I use DNAT to redirect traffic from the external lan eth0 (192.168.1.1) t=
o a
> specific host (192.168.10.10) on the internal lan (eth1) like this:
>=20
> iptables -t nat -A PREROUTING  -p tcp --dport 80  -d 192.168.1.1 -j DNAT=
=20
>     --to 192.168.10.10 -i eth0
>=20
> and then I allow the redirected traffic:
> iptables -a FORWARD -p tcp --dport 80  -d 192.168.10.10 ........
>=20
> It works as expected but with this aproach, it's actually possible from t=
he outside
> to find out what internal ip, the http server is located at !.
> All one has to do is sending to 192.168.10.1, 192.168.10.2, 192.168.10.3 =
etc.  (to=20
> eth0 on the outside) until one hits the server. The rules allows it.

The 192.168.0.0/24 is a non internet routeable address, meaning all ISP
drop this address range.

Pretty sure you might be able to capture this in prerouting (mangle) and
drop it there, although your not meant to drop/filter table

also if you have rp_filter on (for the internet interface) it would probabl=
y capture it first before
it hits netfilter=20


>=20
> I have not been able to figure out how to solve this problem.
>=20
>=20
> Any suggestions.
>=20
> Thanks in advance
> Bo Jacobsen
>=20
>=20
>=20
>=20

--ixDgnS8AC6zwmyK0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD0DBQFAh0DBkZz88chpJ2MRAvakAJCimj/xfnudHDJ17Brt/qGjH5QAoLMPZADd
+3e/HCPzPplJpe98GxZN
=4aAy
-----END PGP SIGNATURE-----

--ixDgnS8AC6zwmyK0--

