From: Stephen Frost <sfrost@snowman.net>
Subject: Re: deny cgi scanner
Date: Tue, 1 Apr 2003 15:06:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030401200652.GY18434@ns.snowman.net>
References: <3E89CD8A.5020007@gmx.ch> <1049219263.4784.14.camel@elendil.intranet.cartel-securite.net> <3E89EBE5.5090804@gmx.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9989e9MCpLPr9Uiv"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E89EBE5.5090804@gmx.ch>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Eric Marchionni <mailing-lists@gmx.ch>
Cc: Cedric Blancher <blancher@cartel-securite.fr>, netfilter@lists.netfilter.org


--9989e9MCpLPr9Uiv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Eric Marchionni (mailing-lists@gmx.ch) wrote:
> as far as i understand this will result in a slowdowned scan.
> if somehow possible i'd like to abort the scan at all. like
> denying any connection from the attackers ip for about 1 minute=20
> or so...
> (i know it's dangerous if someone begins spoofing google-ip or
> my dns-server-ip with a cronjob, but this would only affect the
> web-server...)
>=20
> else i'll use iplimit ;-D

Use iplimit with ipt_recent and you can achieve exactly that.  Or just
use ipt_recent if you can come up with a rule to identify the attacker
w/o using iplimit.  To use ipt_recent you do:

# Bad guy in the list with activity less than 60 seconds ago..
iptables -A FORWARD -m recent --rcheck --seconds 60 --name badguy -j DROP=
=20

# Check for bad guy, go to BADCHAIN if found..
iptables -A FORWARD -m limit --etcetc -j BADCHAIN=20

# Bad guy detected!  Add his IP to the badguy list!
iptables -A BADCHAIN -m recent --set --name badguy -j DROP # Add IP to list

The ipt_recent module homepage is
http://snowman.net/projects/ipt_recent/

A pretty recent version (0.3.0) is also in netfilter CVS.  ipt_recent
0.3.1 is out and I expect it will be in netfilter CVS soon.  The primary
fix in 0.3.1 is TTL handling.

	Stephen

--9989e9MCpLPr9Uiv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ifFbrzgMPqB3kigRAuZoAKCD39GUQMgVUU6GJZEbPOLDtw28iACeNoaR
AyhqteEIu/rLF9gWS3cyTYo=
=mGfJ
-----END PGP SIGNATURE-----

--9989e9MCpLPr9Uiv--

