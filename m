From: Harald Welte <laforge@netfilter.org>
Subject: Re: Fragments and connection tracking
Date: Mon, 11 Jul 2005 09:42:07 +0200
Message-ID: <20050711074206.GJ15121@sunbeam.de.gnumonks.org>
References: <1119465338.5378.4.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1119465338.5378.4.camel@jasiiitosh.nexusmgmt.com>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>


--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2005 at 02:35:37PM -0400, John A. Sullivan III wrote:
> We are working to use an iptables based VPN for a client where teh
> certificates do not fit into a single packet. Thus we have a
> fragmentation problem.  We normally drop all fragments on the Internet
> interfaces in our rule sets.  We are a little hesitant to stop doing so.
>=20
> Does connection tracking make it safe to do so or does it make it more
> dangerous? I understand that connection tracking will reassemble the
> fragments.  If someone is trying to attack by sending lots of non-head
> fragments, will connection tracking drop those as invalid or will this
> produce a denial of service attack as connection tracking tries to match
> a flood of fragments without first fragments? Thanks - John

Connection tracking just uses the normal ip_defrag() code, so it would
behave exactly like the fragment cache of a linux end host.

And no, conntrack cannot make fragment-based attacks safe. IP
fragmentation on the open internet is a serious flaw and introduces many
security risks.

Please see my signature ;)

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC0iLOXaXGVTD0i/8RAhh9AJ9Kql3/DLzr9u19ZbTUt0rsOLWg+QCgoC8f
116Ro6YpSxo5MiZ0tT+T7Ew=
=vYPD
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--

