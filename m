From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: 1:1 NAT
Date: 22 Jan 2003 09:03:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043218993.1543.93.camel@rayw.knowledgefactory.co.za>
References: <001301c2c166$2c7671a0$1e01a8c0@win2k.com>
	 <1043212908.1541.67.camel@rayw.knowledgefactory.co.za>
	 <1043217751.668.75.camel@tux.rsn.bth.se>
	 <1043218220.1543.78.camel@rayw.knowledgefactory.co.za>
	 <1043218930.657.77.camel@tux.rsn.bth.se>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-rCKwQYX/ve/d4VRkg17c"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043218930.657.77.camel@tux.rsn.bth.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-rCKwQYX/ve/d4VRkg17c
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-01-22 at 09:02, Martin Josefsson wrote:
> On Wed, 2003-01-22 at 07:50, Raymond Leach wrote:
> > On Wed, 2003-01-22 at 08:42, Martin Josefsson wrote:
> > > On Wed, 2003-01-22 at 06:21, Raymond Leach wrote:
> > > > There is a patch-o-matic patch called SAME which does 1:1 NAT.
> > > >=20
> > > > iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/24 -j SAME
> > > > 196.4.160.0/24
> > >=20
> > > No it doesn't.
> > >=20
> > > you are thinking of NETMAP not SAME.
> > OK. Sorry ... what does SAME do?
>=20
> It makes sure a client always gets the same ipaddress after NAT. No
> loadbalancing like SNAT.
OK. Sorry again for the confusion.



--=-rCKwQYX/ve/d4VRkg17c
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+LkIxh1fuR/Bv+ygRAsVLAJ4lMaws1HvwR/MBMMRmvGjMgqW/bgCdHGxk
DI4vwsrJJRn2PZ3xKnq20G0=
=fBeo
-----END PGP SIGNATURE-----

--=-rCKwQYX/ve/d4VRkg17c--


