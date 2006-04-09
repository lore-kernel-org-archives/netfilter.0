From: Alexander Samad <alex@samad.com.au>
Subject: Re: NATed packets only enter the default routing table
Date: Mon, 10 Apr 2006 08:00:23 +1000
Message-ID: <20060409220023.GG7764@hufpuf.lan1.hme1.samad.com.au>
References: <20060408194058.71fa3e09.mailinglists@lucassen.org>
	<200604091556.02586.jeroen@elebaut.com>
	<20060409203058.6e375d70.mailinglists@lucassen.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5UGlQXeG3ziZS81+"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20060409203058.6e375d70.mailinglists@lucassen.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--5UGlQXeG3ziZS81+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 09, 2006 at 08:30:58PM +0200, richard lucassen wrote:
> On Sun, 9 Apr 2006 15:56:02 +0200
> Jeroen Elebaut <jeroen@elebaut.com> wrote:
>=20
> > i had a similar problem with our setup. The problem is i think that
> > the  routing decision on the linux box is made before the address in
> > the packet is  changed back to 1.2.3.3. So it doesn't use the source
> > policy routing entry. I  solved this by using the connmark module from
> > iptables and then do routing  based on the mark. The following should
> > work in your setup:
> >=20
> > iptables -t mangle -I PREROUTING -m conntrack --ctstate
> > ESTABLISHED,RELATED -j  CONNMARK --restore-mark
> > iptables -t mangle -I PREROUTING -i eth1 -m conntrack --ctstate NEW=20
> > -j  CONNMARK --set-mark 1
> >=20
> > ip rule add fwmark 1 lookup eth1_up
>=20
> I already found out this:
>=20
> iptables -t mangle -A PREROUTING -i eth1 -d 192.168.201.3 \
>  -j CONNMARK --set-mark 1
>=20
> iptables -t mangle -A PREROUTING -i eth2 -s 10.0.2.1 \
>  -j CONNMARK --restore-mark
>=20
> > This will route everything that entered via eth1 back via eth1.
>=20
> And indeed that was the solution. Thnx!
>=20
> R.
Are the kernel patches from here  http://www.ssi.bg/~ja/ the ones that
fix this problem as well.


>=20
> --=20
> ___________________________________________________________________
> It is better to remain silent and be thought a fool, than to speak
> aloud and remove all doubt.
>=20
> +------------------------------------------------------------------+
> | Richard Lucassen, Utrecht                                        |
> | Public key and email address:                                    |
> | http://www.lucassen.org/mail-pubkey.html                         |
> +------------------------------------------------------------------+
>=20
>=20

--5UGlQXeG3ziZS81+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEOYP3kZz88chpJ2MRAhzlAKDaGCIRKV9Yjn4f21XRTsjcupvMvQCfVe89
M4BSgp2AvVXjQBWtHgL8yLo=
=/ER9
-----END PGP SIGNATURE-----

--5UGlQXeG3ziZS81+--

