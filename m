From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: Firewalling non-IPsec connections
Date: Wed, 17 Dec 2003 19:37:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031218003746.GA20788@alcove.wittsend.com>
References: <GFEPJIHHFOJDOFDMNAJDIEAGEKAA.mark@npsl.co.uk> <3FE0D27B.9080900@hoeg.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3FE0D27B.9080900@hoeg.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Peter Hoeg <disposable1@hoeg.com>
Cc: Netfilter List <netfilter@lists.netfilter.org>


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2003 at 11:02:35PM +0100, Peter Hoeg wrote:
> Mark Weaver wrote:
>=20
> >I have to guess so.  I've no idea TBH where the packets actually go, but
> >this definitely works for me.  I'm more of a cook than a chef when it co=
mes
> >to netfilter.  I've tried looking around the source, but I'm pretty
> >clueless, and the native ipsec doesn't seem to be documented at all.  It=
's
> >not even got a maintainer listed, and virtually nothing in
> >linux/Documentation.  (If anyone could point me in the right direction t=
hat
> >would be great!).

> mark, you simply rule! this fixed my problem. now, since i was going=20
> nuts trying to figure it out and i couldn't find ANY info on ANYWHERE=20
> (you guys were my last resort), so i have decided to make a small guide=
=20
> (i needed to learn docbook anyway so this seemed like a good chance)=20
> which can be found here:

> http://hoeg.org/lri/

> but one thing - to be honest i actually was thinking briefly about the=20
> MARK solution myself but came to the conclusion that since it is similar=
=20
> to the TOS marks you can set, then technically somebody else could tag=20
> the packets themselves before entering my system which would bypass the=
=20
> solution. and thats why i didnt take it further. can anybody shed any=20
> light on that?

	No...  TOS is contained in the packet.  It's actually a header
field.  MARK is not.  It's not a part of the packet at all outside of the
system.  It can not be introduced from outside the system.

> but in order for the search engines to pick up this message: racoon=20
> linux kernel 2.6 ipsec vpn tunnel firewall iptables netfilter

> >It kind of makes sense, because without this we'd have no possibility of
> >handling packets that came in via an IPSC tunnel separately.

> agree

	Mike
--=20
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=3Dmhw=3D|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/=
mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iQCVAwUBP+D22uHJS0bfHdRxAQE1kQQAp3yBc+4byqN58OOPBV9vnI26UssarKF5
IRkg237UoQ1g9Cz2c+mCeJI5VDpZwTCvdm52oqK1QPQjfjNNqIqiTMpKl5n7Ka+c
r94bi1ND296YvGhRSSoFshIzwNkOJWiixvdsL4A7fZKqRqQIFjmjsZ/j7xTe12Cp
5dtcmcdZJCE=
=tyvm
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--

