From: Stephen Frost <sfrost@snowman.net>
Subject: Re: deny cgi scanner
Date: Wed, 2 Apr 2003 07:54:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030402125401.GC18434@ns.snowman.net>
References: <3E89CD8A.5020007@gmx.ch> <1049219263.4784.14.camel@elendil.intranet.cartel-securite.net> <3E89EBE5.5090804@gmx.ch> <20030401200652.GY18434@ns.snowman.net> <20030402012310.180c7aac.arnt@c2i.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rltfBdJX5ToILDSK"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030402012310.180c7aac.arnt@c2i.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org


--rltfBdJX5ToILDSK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Arnt Karlsen (arnt@c2i.net) wrote:
> On Tue, 1 Apr 2003 15:06:52 -0500,=20
> Stephen Frost <sfrost@snowman.net> wrote in message=20
> <20030401200652.GY18434@ns.snowman.net>:
> > # Bad guy detected!  Add his IP to the badguy list!
> > iptables -A BADCHAIN -m recent --set --name badguy -j DROP # Add IP to
> > list
>=20
> ..this also shoots down the good guys with servers on dynamic dns,=20
> using an old recycled-by-the-isp bad guy's ip.

That's why there's a time limit to it.  Chances are pretty bad you're
going to have a good guy getting the bad guy's ip within 60 seconds and
worse that they're both going to try and go to the given site.
Additionally, there's an option to require a TTL match for those who are
really concerned about it to make it even less likely to be an issue
(and for cases where the bad guy likes to spoof his IP's, though do
realize that if the bad guy spoof's google's IP address it's not a big
deal because we use this state-based firewalling thing and the recent
module should be used to filter inbound NEW packets, not ones already
set up, so outbound connections to google wouldn't be affected).

And, of course, you can always also create 'whitelists' in addition to
the 'blacklists' in situations where you have friends who like to mess
with other friends (my friends are great sometimes..; of course, it's my
fault for making them listen to me babble on about my wonderful
ipt_recent kernel module ;) ).

	Stephen

--rltfBdJX5ToILDSK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+it1przgMPqB3kigRApWwAJ0VXod2XyJjtvtfIIqWhsrnYT0JnwCfcTGO
KG5qgf4V2i2pgU7S7PU/hZ0=
=t9Aw
-----END PGP SIGNATURE-----

--rltfBdJX5ToILDSK--

