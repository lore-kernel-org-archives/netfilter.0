From: Alexander Samad <alex@samad.com.au>
Subject: Re: Performance vs. Rule Set Size
Date: Wed, 28 Jul 2004 20:21:45 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040728102145.GO5826@samad.com.au>
References: <1090980688.22783.8.camel@dchws.tqmcube.com> <1090982111.2010.103.camel@grendel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MmQIYbZiCoQ2kDro"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1090982111.2010.103.camel@grendel>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter List <netfilter@lists.netfilter.org>


--MmQIYbZiCoQ2kDro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

I have a BLOCKED chain that every packet go through (its before the
EST/RELA rule) and have about 3000 lines and I can still get around
4x200Kbs tcp streams on Telstra cables (about the same with out the
filtering)=20

Alex

On Tue, Jul 27, 2004 at 10:35:11PM -0400, Chris Brenton wrote:
> On Tue, 2004-07-27 at 22:11, David Cary Hart wrote:
> >
> > I realize that there are too many variables to answer this question with
> > great precision so consider this a reality check.
>=20
> So long as you understand what you are asking. ;-)
>=20
> > Our server has been under very heavy attack over the last few weeks. I
> > have been adding individual hosts who try to exploit either httpd or
> > smtp. I now have an input rule set of several hundred lines. Does that
> > seem terribly over-sized or is that fairly common?
>=20
> I've run 400+ on old P-III hardware without a problem. I know others
> have gone beyond even that.
>=20
> One thing you might consider is leveraging custom chains. Something
> like:
>=20
> iptables -N http
> iptables -A FORWARD -i eth0 -p tcp --tcp-flags SYN,ACK SYN -d
> 192.168.1.128/27 --dport 80 -j http
>=20
> replacing "-i" with your external interface and "-d" with the IPs of
> your Web servers.=20
>=20
> Now in the http chain you block all the nasty IPs. You can then either
> permit access to your Web servers within that chain, or come back to the
> forward chain and keep the rule there. What ever makes life easier for
> you.=20
>=20
> Nice thing about the above is all non-http traffic no longer has to
> traverse all your blocking rules. This should help speed up processing.=
=20
>=20
> HTH,
> Chris
> =20
>=20
>=20
>=20

--MmQIYbZiCoQ2kDro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBB345kZz88chpJ2MRAsocAJ9UUS/iSfVHHj3PNlSVE/kO7dMTFACg8GQY
ThEOm1eqOMcYLzYs6kY+C8Y=
=VHKZ
-----END PGP SIGNATURE-----

--MmQIYbZiCoQ2kDro--

